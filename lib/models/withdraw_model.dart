import 'dart:convert';

class WithdrawModel {
  String? customId;
  String? batchId;
  String? paymentId;
  String? paymentNo;
  String? businessNo;
  String? costDetail;
  String? subBusinessNo;
  String? orderTime;
  int? shipmentStatus;
  String? remark;
  String? lineId;
  String? customName;
  String? goodsType;
  String? goodsName;
  String? packingWay;
  String? lineName;
  String? sendAddress;
  String? sendAddressDivision;
  String? sendAddressDescribe;
  String? sendName;
  String? sendPhone;
  String? receiptAddress;
  String? receiptAddressDivision;
  String? receiptAddressDescribe;
  String? receiptName;
  String? receiptPhone;
  String? loadTime;
  int? loadNum;
  String? unloadTime;
  int? unloadNum;
  String? loadBills;
  String? unloadBills;
  String? signer;
  String? signTime;
  String? signRemark;
  int? capacityType;
  String? vehicleNo;
  String? driver;
  String? feeType;
  int? paymentState;
  int? withdrawalState;
  int? paymentMethod;
  String? payableAmount;
  String? totalAmount;
  String? payee;
  String? paymentTime;
  String? optName;
  String? optPhone;
  String? optOrg;
  String? undoReason;
  String? auditor;
  String? auditDeptId;
  String? auditTime;
  int? reviewState;
  String? rejectReason;
  String? createTime;
  String? entityId;

  LineModel? lineModel;

  bool select = false;

  WithdrawModel(
      {this.customId,
      this.batchId,
      this.paymentId,
      this.paymentNo,
      this.businessNo,
      this.costDetail,
      this.lineId,
      this.customName,
      this.subBusinessNo,
      this.orderTime,
      this.shipmentStatus,
      this.remark,
      this.goodsType,
      this.goodsName,
      this.packingWay,
      this.lineName,
      this.sendAddress,
      this.sendAddressDivision,
      this.sendAddressDescribe,
      this.sendName,
      this.sendPhone,
      this.receiptAddress,
      this.receiptAddressDivision,
      this.receiptAddressDescribe,
      this.receiptName,
      this.receiptPhone,
      this.loadTime,
      this.loadNum,
      this.unloadTime,
      this.unloadNum,
      this.loadBills,
      this.unloadBills,
      this.signer,
      this.signTime,
      this.signRemark,
      this.capacityType,
      this.vehicleNo,
      this.driver,
      this.feeType,
      this.paymentState,
      this.withdrawalState,
      this.paymentMethod,
      this.payableAmount,
      this.totalAmount,
      this.payee,
      this.paymentTime,
      this.optName,
      this.optPhone,
      this.optOrg,
      this.undoReason,
      this.auditor,
      this.auditDeptId,
      this.auditTime,
      this.reviewState,
      this.rejectReason,
      this.createTime,
      this.entityId});

  WithdrawModel.fromJson(Map<String, dynamic> json) {
    costDetail = json['costDetail'];
    customId = json['customId'];
    batchId = json['batchId'];
    lineId = json['lineId'];
    customName = json['customName'];
    paymentId = json['paymentId'];
    paymentNo = json['paymentNo'];
    businessNo = json['businessNo'];
    subBusinessNo = json['subBusinessNo'];
    orderTime = json['orderTime'];
    shipmentStatus = json['shipmentStatus'];
    remark = json['remark'];
    goodsType = json['goodsType'];
    goodsName = json['goodsName'];
    packingWay = json['packingWay'];
    lineName = json['lineName'];
    sendAddress = json['sendAddress'];
    sendAddressDivision = json['sendAddressDivision'];
    sendAddressDescribe = json['sendAddressDescribe'];
    sendName = json['sendName'];
    sendPhone = json['sendPhone'];
    receiptAddress = json['receiptAddress'];
    receiptAddressDivision = json['receiptAddressDivision'];
    receiptAddressDescribe = json['receiptAddressDescribe'];
    receiptName = json['receiptName'];
    receiptPhone = json['receiptPhone'];
    loadTime = json['loadTime'];
    loadNum = (json['loadNum'] as num?)?.toInt();
    unloadTime = json['unloadTime'];
    unloadNum = (json['unloadNum'] as num?)?.toInt();
    loadBills = json['loadBills'];
    unloadBills = json['unloadBills'];
    signer = json['signer'];
    signTime = json['signTime'];
    signRemark = json['signRemark'];
    capacityType = json['capacityType'];
    vehicleNo = json['vehicleNo'];
    driver = json['driver'];
    feeType = json['feeType'];
    paymentState = json['paymentState'];
    withdrawalState = json['withdrawalState'];
    paymentMethod = json['paymentMethod'];
    payableAmount = json['payableAmount'];
    totalAmount = json['totalAmount'];
    payee = json['payee'];
    paymentTime = json['paymentTime'];
    optName = json['optName'];
    optPhone = json['optPhone'];
    optOrg = json['optOrg'];
    undoReason = json['undoReason'];
    auditor = json['auditor'];
    auditDeptId = json['auditDeptId'];
    auditTime = json['auditTime'];
    reviewState = json['reviewState'];
    rejectReason = json['rejectReason'];
    createTime = json['createTime'];
    entityId = json['entityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customId'] = customId;
    data['batchId'] = batchId;
    data['costDetail'] = costDetail;
    data['customName'] = customName;
    data['paymentId'] = paymentId;
    data['paymentNo'] = paymentNo;
    data['businessNo'] = businessNo;
    data['lineId'] = lineId;
    data['subBusinessNo'] = subBusinessNo;
    data['orderTime'] = orderTime;
    data['shipmentStatus'] = shipmentStatus;
    data['remark'] = remark;
    data['goodsType'] = goodsType;
    data['goodsName'] = goodsName;
    data['packingWay'] = packingWay;
    data['lineName'] = lineName;
    data['sendAddress'] = sendAddress;
    data['sendAddressDivision'] = sendAddressDivision;
    data['sendAddressDescribe'] = sendAddressDescribe;
    data['sendName'] = sendName;
    data['sendPhone'] = sendPhone;
    data['receiptAddress'] = receiptAddress;
    data['receiptAddressDivision'] = receiptAddressDivision;
    data['receiptAddressDescribe'] = receiptAddressDescribe;
    data['receiptName'] = receiptName;
    data['receiptPhone'] = receiptPhone;
    data['loadTime'] = loadTime;
    data['loadNum'] = loadNum;
    data['unloadTime'] = unloadTime;
    data['unloadNum'] = unloadNum;
    data['loadBills'] = loadBills;
    data['unloadBills'] = unloadBills;
    data['signer'] = signer;
    data['signTime'] = signTime;
    data['signRemark'] = signRemark;
    data['capacityType'] = capacityType;
    data['vehicleNo'] = vehicleNo;
    data['driver'] = driver;
    data['feeType'] = feeType;
    data['paymentState'] = paymentState;
    data['withdrawalState'] = withdrawalState;
    data['paymentMethod'] = paymentMethod;
    data['payableAmount'] = payableAmount;
    data['totalAmount'] = totalAmount;
    data['payee'] = payee;
    data['paymentTime'] = paymentTime;
    data['optName'] = optName;
    data['optPhone'] = optPhone;
    data['optOrg'] = optOrg;
    data['undoReason'] = undoReason;
    data['auditor'] = auditor;
    data['auditDeptId'] = auditDeptId;
    data['auditTime'] = auditTime;
    data['reviewState'] = reviewState;
    data['rejectReason'] = rejectReason;
    data['createTime'] = createTime;
    data['entityId'] = entityId;
    return data;
  }
}

class LineModel {
  String? lineId;
  String? name;
  String? sendAddressId;
  String? receiptAddressId;
  int? isUsual;
  int? hasVia;
  String? appId;
  String? tenantId;
  SendAddress? sendAddress;
  SendAddress? receiptAddress;
  List<ViaList>? viaList;
  String? createTime;
  String? entityId;

  LineModel(
      {this.lineId,
      this.name,
      this.sendAddressId,
      this.receiptAddressId,
      this.isUsual,
      this.hasVia,
      this.appId,
      this.tenantId,
      this.sendAddress,
      this.receiptAddress,
      this.viaList,
      this.createTime,
      this.entityId});

  LineModel.fromJson(Map<String, dynamic> json) {
    lineId = json['lineId'];
    name = json['name'];
    sendAddressId = json['sendAddressId'];
    receiptAddressId = json['receiptAddressId'];
    isUsual = json['isUsual'];
    hasVia = json['hasVia'];
    appId = json['appId'];
    tenantId = json['tenantId'];
    sendAddress = json['sendAddress'] != null
        ? SendAddress.fromJson(json['sendAddress'])
        : null;
    receiptAddress = json['receiptAddress'] != null
        ? SendAddress.fromJson(json['receiptAddress'])
        : null;
    if (json['viaList'] != null) {
      viaList = <ViaList>[];
      json['viaList'].forEach((v) {
        viaList!.add(ViaList.fromJson(v));
      });
    }
    createTime = json['createTime'];
    entityId = json['entityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lineId'] = lineId;
    data['name'] = name;
    data['sendAddressId'] = sendAddressId;
    data['receiptAddressId'] = receiptAddressId;
    data['isUsual'] = isUsual;
    data['hasVia'] = hasVia;
    data['appId'] = appId;
    data['tenantId'] = tenantId;
    if (sendAddress != null) {
      data['sendAddress'] = sendAddress!.toJson();
    }
    if (receiptAddress != null) {
      data['receiptAddress'] = receiptAddress!.toJson();
    }
    if (viaList != null) {
      data['viaList'] = viaList!.map((v) => v.toJson()).toList();
    }
    data['createTime'] = createTime;
    data['entityId'] = entityId;
    return data;
  }
}

class SendAddress {
  String? addressId;
  String? type;
  String? administrativeArea;
  String? administrativeAreaCode;
  String? details;
  String? longitude;
  String? latitude;
  String? appId;
  String? tenantId;
  List<ContactList>? contactList;
  String? createTime;
  String? entityId;

  SendAddress(
      {this.addressId,
      this.type,
      this.administrativeArea,
      this.administrativeAreaCode,
      this.details,
      this.longitude,
      this.latitude,
      this.appId,
      this.tenantId,
      this.contactList,
      this.createTime,
      this.entityId});

  SendAddress.fromJson(Map<String, dynamic> json) {
    addressId = json['addressId'];
    type = json['type'];
    administrativeArea = json['administrativeArea'];
    administrativeAreaCode = json['administrativeAreaCode'];
    details = json['details'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    appId = json['appId'];
    tenantId = json['tenantId'];
    if (json['contactList'] != null) {
      contactList = <ContactList>[];
      json['contactList'].forEach((v) {
        contactList!.add(ContactList.fromJson(v));
      });
    }
    createTime = json['createTime'];
    entityId = json['entityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['addressId'] = addressId;
    data['type'] = type;
    data['administrativeArea'] = administrativeArea;
    data['administrativeAreaCode'] = administrativeAreaCode;
    data['details'] = details;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['appId'] = appId;
    data['tenantId'] = tenantId;
    if (contactList != null) {
      data['contactList'] = contactList!.map((v) => v.toJson()).toList();
    }
    data['createTime'] = createTime;
    data['entityId'] = entityId;
    return data;
  }
}

class ContactList {
  String? contactId;
  String? businessId;
  String? name;
  String? phone;
  String? appId;
  String? tenantId;
  String? createTime;
  String? entityId;

  ContactList(
      {this.contactId,
      this.businessId,
      this.name,
      this.phone,
      this.appId,
      this.tenantId,
      this.createTime,
      this.entityId});

  ContactList.fromJson(Map<String, dynamic> json) {
    contactId = json['contactId'];
    businessId = json['businessId'];
    name = json['name'];
    phone = json['phone'];
    appId = json['appId'];
    tenantId = json['tenantId'];
    createTime = json['createTime'];
    entityId = json['entityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contactId'] = contactId;
    data['businessId'] = businessId;
    data['name'] = name;
    data['phone'] = phone;
    data['appId'] = appId;
    data['tenantId'] = tenantId;
    data['createTime'] = createTime;
    data['entityId'] = entityId;
    return data;
  }
}

class ViaList {
  String? viaId;
  String? tenantId;
  String? lineId;
  String? type;
  String? addressId;
  SendAddress? address;
  String? createTime;
  String? entityId;

  ViaList(
      {this.viaId,
      this.tenantId,
      this.lineId,
      this.type,
      this.addressId,
      this.address,
      this.createTime,
      this.entityId});

  ViaList.fromJson(Map<String, dynamic> json) {
    viaId = json['viaId'];
    tenantId = json['tenantId'];
    lineId = json['lineId'];
    type = json['type'];
    addressId = json['addressId'];
    address =
        json['address'] != null ? SendAddress.fromJson(json['address']) : null;
    createTime = json['createTime'];
    entityId = json['entityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['viaId'] = viaId;
    data['tenantId'] = tenantId;
    data['lineId'] = lineId;
    data['type'] = type;
    data['addressId'] = addressId;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['createTime'] = createTime;
    data['entityId'] = entityId;
    return data;
  }
}
