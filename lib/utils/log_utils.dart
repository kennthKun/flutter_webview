import 'package:logger/logger.dart';

var _logger =
    Logger(filter: null, printer: PrettyPrinter(methodCount: 0), output: null);

logV(dynamic message) {
  _logger.v(message);
}

logD(dynamic message) {
  _logger.d(message);
}

logI(dynamic message) {
  _logger.i(message);
}

logW(dynamic message) {
  _logger.w(message);
}

logE(dynamic message) {
  _logger.e(message);
}

logWTF(dynamic message) {
  _logger.wtf(message);
}
