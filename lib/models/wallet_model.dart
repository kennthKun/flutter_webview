import 'package:gyk_flutter_webview/models/driver_model.dart';
import 'package:gyk_flutter_webview/models/user_info.dart';

class WalletModel {
  String? userId;
  String? level;
  String? name;
  String? phone;
  String? balance;
  int? faceState;
  int? userState;
  int? reviewState;
  String? createTime;
  String? entityId;
  List<BankCardModel>? bankcardList;
  DriverModel? driver;

  /// 机动车行驶证状态（1.未认证；2.已认证；3.未通过）
  int? vehicleLicenceState;

  /// 实名认证状态（1.未认证；2.已认证；3.未通过）
  int? realNameState;

  /// 驾驶证状态（1.未认证；2.已认证；3.未通过）
  int? driverLicenseState;

  /// 从业资格证状态（1.未认证；2.已认证；3.未通过）
  int? certificateState;

  /// 道路经营许可证状态（1.未认证；2.已认证；3.未通过）
  int? transportBusinessState;

  /// 道路运输证状态 (1.未认证；2.已认证；3.未通过）
  int? transportLicenceState;

  WalletModel(
      {this.userId,
      this.level,
      this.name,
      this.phone,
      this.balance,
      this.realNameState,
      this.faceState,
      this.userState,
      this.reviewState,
      this.createTime,
      this.entityId,
      this.bankcardList,
      this.driver,
      this.vehicleLicenceState,
      this.driverLicenseState,
      this.certificateState,
      this.transportBusinessState,
      this.transportLicenceState});

  WalletModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    level = json['level'];
    name = json['name'];
    phone = json['phone'];
    balance = json['balance'];
    realNameState = json['realNameState'];
    faceState = json['faceState'];
    userState = json['userState'];
    reviewState = json['reviewState'];
    createTime = json['createTime'];
    entityId = json['entityId'];
    if (json['bankcardList'] != null) {
      bankcardList = (json['bankcardList'] as List<dynamic>)
          .map((e) => BankCardModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    driver =
        json['driver'] != null ? DriverModel.fromJson(json['driver']) : null;
    vehicleLicenceState = (json['vehicleLicenceState'] as num?)?.toInt();
    driverLicenseState = (json['driverLicenseState'] as num?)?.toInt();
    certificateState = (json['certificateState'] as num?)?.toInt();
    transportBusinessState = (json['transportBusinessState'] as num?)?.toInt();
    transportLicenceState = (json['transportLicenceState'] as num?)?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['level'] = level;
    data['name'] = name;
    data['phone'] = phone;
    data['balance'] = balance;
    data['realNameState'] = realNameState;
    data['faceState'] = faceState;
    data['userState'] = userState;
    data['reviewState'] = reviewState;
    data['createTime'] = createTime;
    data['entityId'] = entityId;
    if (bankcardList != null) {
      data['bankcardList'] = bankcardList!.map((v) => v.toJson()).toList();
    }
    data['driver'] = driver;
    data['vehicleLicenceState'] = vehicleLicenceState;
    data['driverLicenseState'] = driverLicenseState;
    data['certificateState'] = certificateState;
    data['transportBusinessState'] = transportBusinessState;
    data['transportLicenceState'] = transportLicenceState;
    return data;
  }
}

class BankCardModel {
  String? bankcardId;
  String? bankcardNo;
  String? openBank;
  String? bankcode;
  String? openArea;
  String? branchName;
  String? phone;
  int? bindState;
  String? createTime;
  String? entityId;

  BankCardModel(
      {this.bankcardId,
      this.bankcardNo,
      this.openBank,
      this.bankcode,
      this.openArea,
      this.branchName,
      this.phone,
      this.bindState,
      this.createTime,
      this.entityId});

  BankCardModel.fromJson(Map<String, dynamic> json) {
    bankcardId = json['bankcardId'];
    bankcardNo = json['bankcardNo'];
    openBank = json['openBank'];
    bankcode = json['bankcode'];
    openArea = json['openArea'];
    branchName = json['branchName'];
    phone = json['phone'];
    bindState = json['bindState'];
    createTime = json['createTime'];
    entityId = json['entityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bankcardId'] = bankcardId;
    data['bankcardNo'] = bankcardNo;
    data['openBank'] = openBank;
    data['bankcode'] = bankcode;
    data['openArea'] = openArea;
    data['branchName'] = branchName;
    data['phone'] = phone;
    data['bindState'] = bindState;
    data['createTime'] = createTime;
    data['entityId'] = entityId;
    return data;
  }
}
