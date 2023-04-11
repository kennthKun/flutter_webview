import 'package:gyk_flutter_webview/models/driver_model.dart';
import 'package:gyk_flutter_webview/models/user_info.dart';
import 'package:sp_util/sp_util.dart';

import 'constant.dart';

class UserUtil {
  static bool isLogin() {
    final token = SpUtil.getString(Constants.token);
    if (token == null || token == '') {
      return false;
    }
    return true;
  }

  static DriverModel userInfo() {
    final userInfo = SpUtil.getObject(Constants.lyUserinfo);
    if (userInfo != null) {
      return DriverModel.fromJson(userInfo as Map<String, dynamic>);
    }
    return DriverModel();
  }

  static String getPhone() {
    return userInfo().phone ?? '';
  }

  static getName() {
    return userInfo().name ?? '';
  }

  static getDriverId() {
    return userInfo().driverId ?? '';
  }

  static getIdcard() {
    return userInfo().idcard ?? '';
  }

  static getLeaveModels() {
    return userInfo().leaveModels ?? '';
  }

  static getDriverLicenseOrgan() {
    return userInfo().driverLicenseOrgan ?? '';
  }

  static List<VehicleData> getVehicleList() {
    return userInfo().vehicleList ?? [];
  }

  static void updateUserInfo(DriverModel driver) {
    SpUtil.putObject(Constants.lyUserinfo, driver);
  }
}
