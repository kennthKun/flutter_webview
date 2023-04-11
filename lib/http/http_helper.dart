import 'package:gyk_flutter_webview/utils/constant.dart';
import 'package:gyk_flutter_webview/utils/log_utils.dart';
import 'package:gyk_flutter_webview/utils/utils.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sp_util/sp_util.dart';

import 'api.dart';

// const String serviceBaseUrl = 'https://eshop.api.uuuuuua.me';

class HttpHelper {
  /// 媒体文件格式转换
  static MediaType getMediaType(final String fileName) {
    var fileExt = '.${fileName.split('.').last}';
    switch (fileExt) {
      case ".jpg":
      case ".jpeg":
      case ".jpe":
        return MediaType("image", "jpeg");
      case ".png":
        return MediaType("image", "png");
      case ".bmp":
        return MediaType("image", "bmp");
      case ".gif":
        return MediaType("image", "gif");
      case ".json":
        return MediaType("application", "json");
      case ".svg":
      case ".svgz":
        return MediaType("image", "svg+xml");
      case ".mp3":
      case ".m4a":
        return MediaType("audio", "mpeg");
      case ".wav":
        return MediaType("audio", "x-wav");
      case ".mpg4":
      case ".MPG4":
      case ".MP4":
      case ".mp4":
        return MediaType("video", "mp4");
      case ".MOV":
      case ".mov":
        return MediaType("video", "quicktime");
      case ".m4v":
        return MediaType("video", "x-m4v");
      case ".mpe":
      case ".mpeg":
      case ".mpg":
        return MediaType("video", "mpeg");
      case ".htm":
      case ".html":
        return MediaType("text", "html");
      case ".css":
        return MediaType("text", "css");
      case ".csv":
        return MediaType("text", "csv");
      case ".txt":
      case ".text":
      case ".conf":
      case ".def":
      case ".log":
      case ".in":
        return MediaType("text", "plain");
    }
    return MediaType("image", "jpeg");
  }

  static formatError(data) async {
    logD(data);
    int code = data['code'];
    final message = data['message'];
    if (code == 10021 && message != '没有该用户的数据') {
      showToast(message);
    }
    if (code == 10060) {
      showToast(message);
    }
    if (code == 10030) {
      showToast(message);
    }
    if (code == 10051 && message == 'access token 过期') {
      logE(message);
    }
  }

  /// 语言 1:中文 2:英文 必填
  static int getLanguage() {
    final language = SpUtil.getString(Constants.localLanguage);
    if (Utils.isAllBlanks(language)) {
      if (Get.deviceLocale.toString().contains('zh')) {
        return 1;
      }
    } else if (language == 'zh') {
      return 1;
    }
    return 2;
  }

  static Map<String, dynamic> initHeader() {
    Map<String, dynamic> customerMap = {
      'accept': 'application/json',
      'content-Type': 'application/json',
      "tenant_id": 1001,
      "app_id": 1001,
      "domain": HttpHelper.domanin()
    };
    final appId = SpUtil.getString(Constants.lyAppId);
    final tenantId = SpUtil.getString(Constants.lyTenantId);
    final domain = SpUtil.getString(Constants.lyDomain);
    if (!Utils.isAllBlanks(appId) &&
        !Utils.isAllBlanks(tenantId) &&
        !Utils.isAllBlanks(domain)) {
      customerMap = {
        'accept': 'application/json',
        'content-Type': 'application/json',
        "tenant_id": tenantId,
        "app_id": appId,
        "domain": domain,
      };
    }
    final token = SpUtil.getString(Constants.token);
    if (!Utils.isAllBlanks(token)) {
      customerMap['authorization'] = 'bearer $token';
    }
    return customerMap;
  }

  static String domanin() {
    String domanin = '';
    final env = SpUtil.getString(Constants.lyEnv);
    if (Utils.isAllBlanks(env)) {
      domanin = Api.urlMap[Api.currentEnv] ?? 'dev.ailieyun.com';
    } else {
      Api.currentEnv = env!;
      domanin = Api.urlMap[env] ?? 'dev.ailieyun.com';
    }
    return domanin;
  }

  static String baseUrl() {
    return "https://${HttpHelper.domanin()}";
  }
}
