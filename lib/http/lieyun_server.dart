import 'dart:io';

import 'package:gyk_flutter_webview/models/app_update.dart';
import 'package:gyk_flutter_webview/models/branch_name_model.dart';
import 'package:gyk_flutter_webview/models/user_info.dart';
import 'package:gyk_flutter_webview/models/wallet_model.dart';
import 'package:gyk_flutter_webview/models/withdraw_model.dart';
import 'package:gyk_flutter_webview/models/withdrawal_record_model.dart';
// import 'package:gyk_flutter_webview/utils/app_router.dart';
import 'package:gyk_flutter_webview/utils/constant.dart';
import 'package:gyk_flutter_webview/utils/log_utils.dart';
import 'package:gyk_flutter_webview/utils/user_utils.dart';
import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import 'api.dart';
import 'lieyun_http.dart';

class LieyunServer {
  /// 获取真正的ID
  Future initTenant() async {
    var response = await http.get(Api.initTenant);
    return response.data;
  }

  /// 发送短信
  Future sendSms({String phone = '17735466836'}) async {
    var response = await http.post(Api.sendSms + phone);
    return response.data;
  }

  /// 手机号登录
  Future login(String phone, String code) async {
    final appId = SpUtil.getString(Constants.lyAppId);
    final tenantId = SpUtil.getString(Constants.lyTenantId);
    final domain = SpUtil.getString(Constants.lyDomain);
    var response = await http.post(
        '${Api.login}&tenant_id=$tenantId&client_id=$appId&phone=$phone&principal=$code&domain=$domain');
    return response.data;
  }

  /// 手机号登录
  Future loginAccount(String username, String password) async {
    final appId = SpUtil.getString(Constants.lyAppId);
    final tenantId = SpUtil.getString(Constants.lyTenantId);
    var response = await http.post(
        '${Api.loginAccount}&tenant_id=$tenantId&client_id=$appId&client_secret=123456&username=$username&password=$password');
    return response.data;
  }

  /// 获取运单模板
  Future getBusinessFreightTemplate() async {
    var response = await http.get(Api.getBusinessFreightTemplate);
    return response.data;
  }

  /// 根据手机号获取司机（已过期）
  Future<UserInfo?> getDriverByPhone() async {
    var response = await http.get(Api.getDriverByPhone);
    if (response.data == null) {
      return null;
    }
    return UserInfo.fromJson(response.data);
  }

  /// 认证保存
  Future getCertificationUrl() async {
    Map<String, dynamic> map = {
      'data': {
        'accountType': 1,
        'customId': UserUtil.getDriverId(),
      },
    };
    var response = await http.post(Api.getCertification, data: map);
    return response.data;
  }

  /// 保存或查询
  Future saveAndGetCertification() async {
    Map<String, dynamic> map = {
      'data': {
        'accountType': 1,
        'customId': UserUtil.getDriverId(),
      },
    };
    var response = await http.post(Api.saveAndGetCertification, data: map);
    return response.data;
  }

  /// 获取认证Url
  Future getCertificationUrlById() async {
    var response =
        await http.get('${Api.getCertificationById}${UserUtil.getDriverId()}');
    return response.data;
  }

  /// 立即接单
  Future grabFreight(data) async {
    EasyLoading.show(status: "接单进行中......");
    var response = await http.put(Api.grabFreight, data: data);
    return response.data;
  }

  /// 车辆信息
  Future getBasisBasisDriverGetByPhone() async {
    var response = await http.get(Api.getBasisBasisDriverGetByPhone);
    if (response.data == null) {
      return null;
    }
    return response.data;
  }

  /// OCR识别
  Future getBasisOcrIdentify(map) async {
    var response = await http.post(Api.getBasisOcrIdentify, data: map);
    return response.data;
  }

  /// 车辆保存
  Future getBasisVehicleSave(map) async {
    var response = await http.post(Api.getBasisVehicleSave, data: map);
    return response.data;
  }

  /// 车辆保存
  Future getBasisVehicleSaveAndGet(map) async {
    var response = await http.post(Api.getBasisVehicleSaveAndGet, data: map);
    return response.data;
  }

  /// 删除车辆
  Future getBasisDriverUpdateById(map) async {
    var response = await http.put(Api.getBasisDriverUpdateById, data: map);
    return response.data;
  }

  /// 字典查询
  Future getBasisDictList(map) async {
    var response = await http.post(Api.getBasisDictList, data: map);
    return response.data;
  }

  /// 车辆品牌管理
  Future getBasisVehicleBrandList() async {
    Map<String, dynamic> map = {
      "data": {},
    };
    var response = await http.post(Api.getBasisVehicleBrandList, data: map);
    return response.data;
  }

  /// 高德获取路线信息
  Future aMapDriving(String url) async {
    Dio dio = Dio();
    dio.interceptors.add(ApiInterceptor());
    var response = await dio.get(url);
    if (response.data == null) {
      return null;
    }
    return response.data;
  }

  /// 获取运单历史轨迹点
  Future getWaybillHistoryPoint(int startTime, int endTime,
      String? freightSubId, String? vehicleId) async {
    var map = {
      'startTime': formatDate(DateTime.fromMillisecondsSinceEpoch(startTime),
          [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss]),
      'endTime': formatDate(DateTime.fromMillisecondsSinceEpoch(endTime),
          [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss]),
      'freightSubId': freightSubId,
      'vehicleId': vehicleId
    };
    var response = await http.post(Api.getAllPoint, data: map);
    return response.data;
  }

  /// 上传轨迹点
  Future uploadPoint(Map<String, dynamic> map) async {
    var response = await http.post(Api.uploadLocation, data: map);
    if (response.data is bool) {
      return response.data;
    }
    return false;
  }

  /// 更新状态
  Future updateStatus(Map<String, dynamic> data) async {
    var response = await http.put(Api.updateStatus, data: data);
    return response.data;
  }

  /// 更新分段单状态
  Future updateBusinessFreightSubById(Map<String, dynamic> data) async {
    var response = await http.put(Api.updateBusinessFreightSubById, data: data);
    return response.data;
  }

  /// 签署合同
  Future signContract({required String contractId}) async {
    var response = await http.put('${Api.signContract}?contractId=$contractId');
    return response.data;
  }

  /// 提交认证保存
  Future getWalletCertificationSave(map) async {
    var response = await http.post(Api.getWalletCertificationSave, data: map);
    return response.data;
  }

  /// 查询认证列表
  Future getCertificationList(map) async {
    var response = await http.post(Api.getCertificationList, data: map);
    return response.data;
  }

  /// 查询认证状态
  Future getCertificationPage(map) async {
    var response = await http.post(Api.getCertificationPage, data: map);
    return response.data;
  }

  /// 提交认证批量保存
  Future getWalletCertificationSaveBatch(list) async {
    var response =
        await http.post(Api.getWalletCertificationSaveBatch, data: list);
    return response.data;
  }

  /// 打卡
  Future updateBusinessFreightRecord(Map<String, dynamic> data) async {
    var response = await http.post(Api.updateBusinessFreightRecord, data: data);
    return response.data;
  }

  /// 添加银行卡
  Future addBankCard(Map<String, dynamic> data) async {
    var response = await http.post(Api.addBankCard, data: data);
    return response.data;
  }

  /// 查询用户钱包
  Future<WalletModel?> getWallet() async {
    var response = await http.get(Api.getWallet);
    return WalletModel.fromJson(response.data);
  }

  /// 银行卡列表
  Future getBankCardList() async {
    var data = {"current": 1, "size": 20};

    var response = await http.post(Api.getBankCardList, data: data);
    return response.data;
  }

  /// 解绑银行卡
  Future getBankCardDeleteById(id) async {
    var response = await http.delete('${Api.getBankCardDeleteById}/$id');
    return response.data;
  }

  /// 查询可提现记录
  Future<List<WithdrawModel>> getWalletPaymentRecords() async {
    String driverId = UserUtil.getDriverId();
    var data = {
      'data': {'payee': driverId, 'withdrawalState': 1}
    };
    var response = await http.post(Api.walletPaymentRecords, data: data);
    logD('response.data = ${response.data}');

    final list = response.data['content'];

    List<WithdrawModel> dataList = [];
    if ((list is List) && list.isNotEmpty) {
      for (var item in list) {
        dataList.add(WithdrawModel.fromJson(item));
      }
    }
    return dataList;
  }

  /// 查询已通过支付记录
  Future walletPaymentPass(businessNo) async {
    var data = {
      'data': {'businessNo': businessNo, 'reviewState': 2, 'driver': ''}
    };
    var response = await http.post(Api.walletPaymentPass, data: data);
    logD('response.data = ${response.data}');
    return response.data?["content"];
  }

  /// 查询可提现记录线路
  Future<List<LineModel>> getLines(lineIds) async {
    var response = await http.post(Api.getLines, data: lineIds);
    logD('response.data = ${response.data}');
    final list = response.data;

    List<LineModel> dataList = [];
    if ((list is List) && list.isNotEmpty) {
      for (var item in list) {
        dataList.add(LineModel.fromJson(item));
      }
    }
    return dataList;
  }

  /// 司机提现接口
  Future withdrawalSaveBatch(List list) async {
    var response = await http.post(Api.withdrawalSaveBatch, data: list);
    return response.data;
  }

  /// 提现记录分页查询(前端)
  Future<WithdrawalRecordModel> withdrawalRecords(int pageNum) async {
    var data = {
      "current": pageNum,
      "size": 20,
      "data": {'userId': UserUtil.getDriverId()}
    };

    var response = await http.post(Api.withdrawalRecords, data: data);

    return WithdrawalRecordModel.fromJson(response.data);
  }

  /// 根据银行卡获取分支行
  Future<List<BranchNameModel>> getBranchBankList(
      String bankcard, String branchName) async {
    var data = {
      "data": {
        'bankcard': bankcard,
        'branchName': branchName,
      }
    };

    var response = await http.post(Api.bankBranchList, data: data);
    logD('response.data = ${response.data}');
    final list = response.data;

    List<BranchNameModel> dataList = [];
    if ((list is List) && list.isNotEmpty) {
      for (var item in list) {
        dataList.add(BranchNameModel.fromJson(item));
      }
    }
    return dataList;
  }

  /// 运单支付方案
  Future walletPlan(id) async {
    var map = {
      'data': {"businessNo": id}
    };
    var response = await http.post(Api.walletPlan, data: map);
    return response.data;
  }

  /// 校验车机是否开启
  Future checkVehicleExist(map) async {
    var response = await http.post(Api.checkVehicleExist, data: map);
    return response;
  }

  /// SDK是否开启
  Future getSdkConfig() async {
    var data = {
      "data": {
        "configId": "sdk",
      }
    };
    var response = await http.post(Api.getSdkConfig, data: data);
    return response.data;
  }

  /// 模版接单
  Future getTemplateReceipt(data) async {
    var response = await http.post(Api.getTemplateReceipt, data: data);
    return response.data;
  }

  /// 注销
  Future cancellation() async {
    var response = await http.post(Api.clear);
    return response.data;
  }

  /// 查询app更新信息
  Future<AppUpdate> updateVersion() async {
    var map = {
      'data': {
        "code": Platform.isIOS ? Constants.iosVersion : Constants.androidVersion
      }
    };
    var response = await http.post(Api.updateVersion, data: map);

    return AppUpdate.fromJson(response.data ?? {});
  }
}
