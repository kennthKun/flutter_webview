/// 常量
import 'package:amap_flutter_base/amap_flutter_base.dart';

class Constants {
  static const String token = 'lieyunToken';
  static const String refreshToken = 'lieyunRefreshToken';
  static const String localLanguage = 'localLanguage';

  static const String lyTenantId = 'lieyun_tenantId';
  static const String lyAppId = 'lieyun_appId';
  static const String lyDomain = 'lieyun_domain';
  static const String lyUserinfo = 'lieyun_userinfo';
  static const String lyFirstLoginState = 'lieyun_first_login_state';
  static const String lyAgreeState = 'lieyun_agree_state';

  /// 环境
  static const String lyEnv = 'lyEnv';

  /// iOS版本更新
  static const String iosVersion = 'ios_version';

  /// 安卓版本更新
  static const String androidVersion = 'android_version';

  /// 安卓下载链接
  static const String androidDownload =
      'https://android-ios-app-zjk.oss-cn-zhangjiakou.aliyuncs.com/android/v1.0.13/app-release.apk';

  ///注意：使用[AMapWidget]的`apiKey`属性设置的key的优先级高于通过Native配置key的优先级，
  ///使用[AMapWidget]的`apiKey`属性配置后Native配置的key将失效，请根据实际情况选择使用
  static const AMapApiKey amapApiKeys = AMapApiKey(
      androidKey: 'dec46179202fc714ee1dc300fac424d8',
      iosKey: '801e2ebad7ddab6dd3e3439997b18932');

  ///高德隐私合规声明，这里只是示例，实际使用中请按照实际参数设置[AMapPrivacyStatement]的'hasContains''hasShow''hasAgree'这三个参数
  ///
  /// 注意：[AMapPrivacyStatement]的'hasContains''hasShow''hasAgree'这三个参数中有一个为false，高德SDK均不会工作，会造成地图白屏等现象
  ///
  /// 高德开发者合规指南请参考：https://lbs.amap.com/agreement/compliance
  ///
  /// 高德SDK合规使用方案请参考：https://lbs.amap.com/news/sdkhgsy
  static const AMapPrivacyStatement amapPrivacyStatement =
      AMapPrivacyStatement(hasContains: true, hasShow: true, hasAgree: true);

  static const String addBankCardSuccessEvent = 'addBankCardSuccessEvent';
}
