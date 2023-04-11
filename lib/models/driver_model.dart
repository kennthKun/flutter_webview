import 'package:gyk_flutter_webview/models/user_info.dart';

class DriverModel {
  String? driverId;
  String? name;
  String? phone;
  String? idcard;
  String? leaveModels;
  String? driverLicenseNo;
  String? driverLicenseOrgan;
  String? driverLicenseStart;
  String? driverLicenseEnd;
  List<VehicleData>? vehicleList;

  DriverModel({
    this.driverId,
    this.name,
    this.phone,
    this.idcard,
    this.leaveModels,
    this.driverLicenseNo,
    this.driverLicenseOrgan,
    this.driverLicenseStart,
    this.driverLicenseEnd,
    this.vehicleList,
  });
  DriverModel.fromJson(Map<String, dynamic> json) {
    driverId = json['driverId'];
    name = json['name'];
    phone = json['phone'];
    idcard = json['idcard'];
    leaveModels = json['leaveModels'];
    driverLicenseNo = json['driverLicenseNo'];
    driverLicenseOrgan = json['driverLicenseOrgan'];
    driverLicenseStart = json['driverLicenseStart'];
    driverLicenseEnd = json['driverLicenseEnd'];
    if (json['vehicleList'] != null) {
      vehicleList = (json['vehicleList'] as List<dynamic>)
          .map((e) => VehicleData.fromJson(e as Map<String, dynamic>))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['driverId'] = driverId;
    data['name'] = name;
    data['phone'] = phone;
    data['idcard'] = idcard;
    data['leaveModels'] = leaveModels;
    data['driverLicenseNo'] = driverLicenseNo;
    data['driverLicenseOrgan'] = driverLicenseOrgan;
    data['driverLicenseStart'] = driverLicenseStart;
    data['driverLicenseEnd'] = driverLicenseEnd;
    data['vehicleList'] = vehicleList;
    return data;
  }
}
