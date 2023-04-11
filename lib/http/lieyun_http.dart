import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:gyk_flutter_webview/http/http_helper.dart';
// import 'package:gyk_flutter_webview/pages/login/login_page.dart';
import 'package:gyk_flutter_webview/utils/constant.dart';
import 'package:gyk_flutter_webview/utils/loading_util.dart';
import 'package:gyk_flutter_webview/utils/log_utils.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:sp_util/sp_util.dart';

import 'api.dart';
import 'lieyun_base.dart';

final LieyunHttp http = LieyunHttp();

/// 网络请求管理类
class LieyunHttp extends BaseHttpClient {
  @override
  void onInit() {
    interceptors.add(ApiInterceptor());
    super.onInit();
  }

  /// 上传文件
  Future uploadFile(String originalLicensePhoto, {onSendProgress}) async {
    FormData formdata = FormData.fromMap({
      "file": await MultipartFile.fromFile(originalLicensePhoto,
          filename: "phone.jpg"),
    });
    BaseOptions op = BaseOptions(
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 1000 * 120,
      //响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: 1000 * 120,
      responseType: ResponseType.json,
      contentType: Headers.jsonContentType,
    );
    op.headers['Authorization'] = SpUtil.getString(Constants.token);
    Response response = await Dio(op)
        .post(HttpHelper.baseUrl() + Api.uploadFile, data: formdata,
            onSendProgress: (send, total) {
      if (onSendProgress != null) {
        onSendProgress(send, total);
      }
      logD('已发送：$send  总大小：$total');
    });
    logD('---------------- 返回的数据 ----------------');
    logD(response.data);
    return response.data;
  }
}

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final header = HttpHelper.initHeader();
    options.headers = header;
    logD('请求地址 ------ ${options.path}');
    logD('请求头 ------ ${options.headers}');
    logD('baseUrl ------ ${HttpHelper.baseUrl()}');
    logD('baseDomain ------ ${HttpHelper.domanin()}');
    options.baseUrl = HttpHelper.baseUrl();
    if (Api.getBasisVehicleSave == options.path) {
      options.headers['dept_id'] = 1;
    }

    curlLog(options);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logD('----------返回来的数据----------');
    logD('response.data = ${response.data}');
    final data = response.data;
    LoadingUtil.dismiss();

    /// 获取token格式不一样，需要特殊处理
    if (data['code'] == null) {
      return handler.next(response..data = data);
    }

    /// 正常走
    var responseEntity = ResponseEntity.fromJson(response.data);
    if (responseEntity.success) {
      return handler.next(response..data = responseEntity.data);
    } else {
      // 请求token无效
      if (responseEntity.code == -1) {
        // SpUtil.putString(Constants.token, '');
        // Get.offAllNamed(AppRouter.login, arguments: {'hasInternet': true});
        return handler.next(response);
      }
      if (responseEntity.code == 1) {
        return handler.next(response);
      }
      var dioError =
          DioError(requestOptions: response.requestOptions, response: response);

      if (responseEntity.code == 402) {
        // 理论上不应该在这里跳转UI
        // Get.to(const LoginPage(),
        // transition: Transition.cupertino, fullscreenDialog: true);
        // dioError.error = UnAuthorizedException();
        SpUtil.putString(Constants.token, '');
        return handler.reject(dioError);
      }
      // dioError.error = NotSuccessNetException(responseEntity.code, responseEntity.message);
      return handler.reject(dioError);
    }
  }

  void curlLog(RequestOptions options) {
    List<String> components = ['curl -i'];
    if (options.method.toUpperCase() != 'GET') {
      components.add('-X ${options.method}');
    }

    options.headers.forEach((k, v) {
      if (k != 'Cookie') {
        components.add('-H "$k: $v"');
      }
    });

    if (options.data != null) {
      // FormData can't be JSON-serialized, so keep only their fields attributes
      if (options.data is FormData) {
        options.data = Map.fromEntries(options.data.fields);
      }

      final data = json.encode(options.data).replaceAll('"', '\\"');
      components.add('-d "$data"');
    }

    components.add('"${options.uri.toString()}"');

    String curl = components.join(' \\\n\t');

    if (Platform.isAndroid) {
      log(curl);
    } else {
      // ignore_for_file: avoid_print
      print(curl);
    }
  }
}

class ResponseEntity<T> extends BaseResponseEntity<T> {
  ResponseEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'] ?? -1;
    msg = json['msg'] ?? 'fail';
    data = json['data'];
    success = (code == 0);
  }
}
