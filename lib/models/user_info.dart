class UserInfo {
  String? driverId;
  String? name;
  String? phone;
  String? idcard;
  String? leaveModels;
  String? driverLicenseNo;
  String? driverLicenseOrgan;
  String? driverLicenseStart;
  String? driverLicenseEnd;
  String? idcardAddress;
  String? originalIdcardPhoto;
  String? copyIdcardPhoto;
  List<VehicleData>? vehicleList;
  String? createTime;
  String? entityId;

  UserInfo(
      {this.driverId,
      this.name,
      this.phone,
      this.idcard,
      this.leaveModels,
      this.driverLicenseNo,
      this.driverLicenseOrgan,
      this.driverLicenseStart,
      this.driverLicenseEnd,
      this.idcardAddress,
      this.originalIdcardPhoto,
      this.copyIdcardPhoto,
      this.vehicleList,
      this.createTime,
      this.entityId});

  UserInfo.fromJson(Map<String, dynamic> json) {
    driverId = json['driverId'];
    name = json['name'];
    phone = json['phone'];
    idcard = json['idcard'];
    leaveModels = json['leaveModels'];
    driverLicenseNo = json['driverLicenseNo'];
    driverLicenseOrgan = json['driverLicenseOrgan'];
    driverLicenseStart = json['driverLicenseStart'];
    driverLicenseEnd = json['driverLicenseEnd'];
    idcardAddress = json['idcardAddress'];
    originalIdcardPhoto = json['originalIdcardPhoto'];
    copyIdcardPhoto = json['copyIdcardPhoto'];
    if (json['vehicleList'] != null) {
      vehicleList = <VehicleData>[];
      json['vehicleList'].forEach((v) {
        vehicleList!.add(VehicleData.fromJson(v));
      });
    }
    createTime = json['createTime'];
    entityId = json['entityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['driverId'] = driverId;
    data['name'] = name;
    data['phone'] = phone;
    data['idcard'] = idcard;
    data['leaveModels'] = leaveModels;
    data['driverLicenseNo'] = driverLicenseNo;
    data['driverLicenseOrgan'] = driverLicenseOrgan;
    data['driverLicenseStart'] = driverLicenseStart;
    data['driverLicenseEnd'] = driverLicenseEnd;
    data['idcardAddress'] = idcardAddress;
    data['originalIdcardPhoto'] = originalIdcardPhoto;
    data['copyIdcardPhoto'] = copyIdcardPhoto;
    if (vehicleList != null) {
      data['vehicleList'] = vehicleList!.map((v) => v.toJson()).toList();
    }
    data['createTime'] = createTime;
    data['entityId'] = entityId;
    return data;
  }
}

class VehicleData {
  String? photo;
  String? transportBusinessPhoto;
  String? transportLicencePhoto;
  String? purchaseDate;
  String? price;
  String? vehicleChassis;
  String? emissionStandards;
  String? vehicleProperty;
  String? transportBusinessOrgan;
  String? transportBusinessEnd;
  String? transportBusinessNo;
  String? transportLicenceOrgan;
  String? transportLicenceStart;
  String? validityDate;
  String? forceExpiredDate;
  String? licenseNo;
  String? engineNo;
  String? vehicleId;
  int? vehicleType;
  String? vehicleNo;
  String? colorCode;
  String? brandNo;
  String? brandType;
  String? type;
  String? state;
  String? energyType;
  String? loadCapacity;
  String? curbWeight;
  String? passengerCount;
  String? quality;
  String? conductor;
  String? width;
  String? high;
  String? owner;
  String? usingNature;
  String? identificationCode;
  String? certificateOrgan;
  String? registrationDate;
  String? releaseDate;
  String? transportLicenceNo;
  String? originalLicensePhoto;
  String? copyLicensePhoto;
  String? createTime;
  String? entityId;
  String? brandName;

  VehicleData(
      {this.photo,
      this.transportBusinessPhoto,
      this.transportLicencePhoto,
      this.purchaseDate,
      this.price,
      this.vehicleChassis,
      this.emissionStandards,
      this.vehicleProperty,
      this.transportBusinessOrgan,
      this.transportBusinessEnd,
      this.transportBusinessNo,
      this.transportLicenceOrgan,
      this.transportLicenceStart,
      this.validityDate,
      this.forceExpiredDate,
      this.licenseNo,
      this.engineNo,
      this.vehicleId,
      this.vehicleType,
      this.vehicleNo,
      this.colorCode,
      this.brandNo,
      this.brandType,
      this.type,
      this.state,
      this.energyType,
      this.loadCapacity,
      this.curbWeight,
      this.passengerCount,
      this.quality,
      this.conductor,
      this.width,
      this.high,
      this.owner,
      this.usingNature,
      this.identificationCode,
      this.certificateOrgan,
      this.registrationDate,
      this.releaseDate,
      this.transportLicenceNo,
      this.originalLicensePhoto,
      this.copyLicensePhoto,
      this.createTime,
      this.entityId,
      this.brandName});

  VehicleData.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
    transportBusinessPhoto = json['transportBusinessPhoto'];
    transportLicencePhoto = json['transportLicencePhoto'];
    purchaseDate = json['purchaseDate'];
    price = json['price'];
    vehicleChassis = json['vehicleChassis'];
    emissionStandards = json['emissionStandards'];
    vehicleProperty = json['vehicleProperty'];
    transportBusinessOrgan = json['transportBusinessOrgan'];
    transportBusinessEnd = json['transportBusinessEnd'];
    transportBusinessNo = json['transportBusinessNo'];
    transportLicenceOrgan = json['transportLicenceOrgan'];
    transportLicenceStart = json['transportLicenceStart'];
    validityDate = json['validityDate'];
    forceExpiredDate = json['forceExpiredDate'];
    licenseNo = json['licenseNo'];
    engineNo = json['engineNo'];
    vehicleId = json['vehicleId'];
    vehicleType = json['vehicleType'];
    vehicleNo = json['vehicleNo'];
    colorCode = json['colorCode'];
    brandNo = json['brandNo'];
    brandType = json['brandType'];
    type = json['type'];
    state = json['state'];
    energyType = json['energyType'];
    loadCapacity = json['loadCapacity'];
    curbWeight = json['curbWeight'];
    passengerCount = json['passengerCount'];
    quality = json['quality'];
    conductor = json['conductor'];
    width = json['width'];
    high = json['high'];
    owner = json['owner'];
    usingNature = json['usingNature'];
    identificationCode = json['identificationCode'];
    certificateOrgan = json['certificateOrgan'];
    registrationDate = json['registrationDate'];
    releaseDate = json['releaseDate'];
    transportLicenceNo = json['transportLicenceNo'];
    originalLicensePhoto = json['originalLicensePhoto'];
    copyLicensePhoto = json['copyLicensePhoto'];
    createTime = json['createTime'];
    entityId = json['entityId'];
    brandName = json['brandName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['photo'] = photo;
    data['transportBusinessPhoto'] = transportBusinessPhoto;
    data['transportLicencePhoto'] = transportLicencePhoto;
    data['purchaseDate'] = purchaseDate;
    data['price'] = price;
    data['vehicleChassis'] = vehicleChassis;
    data['emissionStandards'] = emissionStandards;
    data['vehicleProperty'] = vehicleProperty;
    data['transportBusinessOrgan'] = transportBusinessOrgan;
    data['transportBusinessEnd'] = transportBusinessEnd;
    data['transportBusinessNo'] = transportBusinessNo;
    data['transportLicenceOrgan'] = transportLicenceOrgan;
    data['transportLicenceStart'] = transportLicenceStart;
    data['validityDate'] = validityDate;
    data['forceExpiredDate'] = forceExpiredDate;
    data['licenseNo'] = licenseNo;
    data['engineNo'] = engineNo;
    data['vehicleId'] = vehicleId;
    data['vehicleType'] = vehicleType;
    data['vehicleNo'] = vehicleNo;
    data['colorCode'] = colorCode;
    data['brandNo'] = brandNo;
    data['brandType'] = brandType;
    data['type'] = type;
    data['state'] = state;
    data['energyType'] = energyType;
    data['loadCapacity'] = loadCapacity;
    data['curbWeight'] = curbWeight;
    data['passengerCount'] = passengerCount;
    data['quality'] = quality;
    data['conductor'] = conductor;
    data['width'] = width;
    data['high'] = high;
    data['owner'] = owner;
    data['usingNature'] = usingNature;
    data['identificationCode'] = identificationCode;
    data['certificateOrgan'] = certificateOrgan;
    data['registrationDate'] = registrationDate;
    data['releaseDate'] = releaseDate;
    data['transportLicenceNo'] = transportLicenceNo;
    data['originalLicensePhoto'] = originalLicensePhoto;
    data['copyLicensePhoto'] = copyLicensePhoto;
    data['createTime'] = createTime;
    data['entityId'] = entityId;
    data['brandName'] = brandName;
    return data;
  }
}
