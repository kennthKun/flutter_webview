import 'package:gyk_flutter_webview/pages/webview.dart';
import 'package:gyk_flutter_webview/pages/barcode_scanner_controller.dart';
import 'package:get/get.dart';

class AppRouter {
  static const root = '/';
  static const scanPage = '/scanPage';

  static final pages = [
    GetPage(name: root, page: () => const Webview()),
    GetPage(name: scanPage, page: () => const BarcodeScannerWithController()),
    // GetPage(name: root, page: () => const BarcodeScannerWithController()),
    // GetPage(name: scanPage, page: () => const Webview()),
  ];
}
