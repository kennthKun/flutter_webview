import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/foundation.dart';

/// 支持多实例的dio扩展类
/// 可支持多个api服务商,
abstract class BaseHttpClient extends DioForNative {
  /// 构造方法处理一些默认参数
  BaseHttpClient() {
    _beforeInit();
    onInit();
    _afterInit();
  }

  void _beforeInit() {
    (transformer as DefaultTransformer).jsonDecodeCallback = _parseJson;
    // 第一个拦截器,打印未经过处理的response数据
  }

  void onInit() {}

  void _afterInit() {
    /// LogInterceptor 需要添加到队尾,interceptors的结构为FIFO
    interceptors.add(HeaderInterceptor());
    // interceptors.add(LogInterceptor());
  }
}

/// 添加常用Header
class HeaderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.connectTimeout = 1000 * 15;
    options.receiveTimeout = 1000 * 120;
    options.sendTimeout = 1000 * 120;
    options.contentType = Headers.jsonContentType;
    super.onRequest(options, handler);
  }
}

/// 基础响应类
///
abstract class BaseResponseEntity<T> {
  late int code;
  late String msg;
  late bool success;
  late T data;

  @override
  String toString() {
    return 'BaseResponseEntity{success: $success,flag: $code, msg: $msg, model: $data}';
  }
}

_parseJson(String data) {
  /// 使用compute条件 数据长度大于10k
  /// 经测试发现compute在后台解码json耗时比直接解码慢很多,这里做个估值判断
  if (data.length > 1024 * 10) {
    return compute(_jsonDecode, data);
  } else {
    return jsonDecode(data);
  }
}

/// 将json字符串转为对象类型
/// 必须是顶层函数
_jsonDecode(String response) {
  return jsonDecode(response);
}
