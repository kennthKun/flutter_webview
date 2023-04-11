
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// loading 工具类
class LoadingUtil {

  /// 加载loading
  static Future<void> loading(String msg) async {
    await EasyLoading.show(
        status: msg,
        maskType: EasyLoadingMaskType.clear
    );
  }

  /// 取消loading
  static Future<void> dismiss() async {
    await EasyLoading.dismiss();
  }
}