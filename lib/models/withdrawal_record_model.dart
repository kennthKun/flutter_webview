class WithdrawalRecordModel {
  List<WithdrawalRecordData>? content;
  String? pageable;
  int? totalPages;
  int? totalElements;
  bool? last;
  int? numberOfElements;
  bool? first;
  int? size;
  int? number;
  bool? empty;

  WithdrawalRecordModel(
      {this.content,
      this.pageable,
      this.totalPages,
      this.totalElements,
      this.last,
      this.numberOfElements,
      this.first,
      this.size,
      this.number,
      this.empty});

  WithdrawalRecordModel.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <WithdrawalRecordData>[];
      json['content'].forEach((v) {
        content!.add(new WithdrawalRecordData.fromJson(v));
      });
    }
    pageable = json['pageable'];
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
    last = json['last'];
    numberOfElements = json['numberOfElements'];
    first = json['first'];
    size = json['size'];
    number = json['number'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    data['pageable'] = this.pageable;
    data['totalPages'] = this.totalPages;
    data['totalElements'] = this.totalElements;
    data['last'] = this.last;
    data['numberOfElements'] = this.numberOfElements;
    data['first'] = this.first;
    data['size'] = this.size;
    data['number'] = this.number;
    data['empty'] = this.empty;
    return data;
  }
}

class WithdrawalRecordData {
  String? withdrawalId;
  String? withdrawalNo;
  String? businessNo;
  String? userId;
  String? identityCode;
  String? vehicleNo;
  String? costDetail;
  String? feeType;
  String? payeeName;
  String? payeeBankCard;
  String? amount;
  String? withdrawalTime;
  int? reviewState;
  User? user;
  String? createTime;
  String? entityId;

  WithdrawalRecordData(
      {this.withdrawalId,
      this.withdrawalNo,
      this.businessNo,
      this.userId,
      this.identityCode,
      this.vehicleNo,
      this.costDetail,
      this.feeType,
      this.payeeName,
      this.payeeBankCard,
      this.amount,
      this.withdrawalTime,
      this.reviewState,
      this.user,
      this.createTime,
      this.entityId});

  WithdrawalRecordData.fromJson(Map<String, dynamic> json) {
    withdrawalId = json['withdrawalId'];
    withdrawalNo = json['withdrawalNo'];
    businessNo = json['businessNo'];
    userId = json['userId'];
    identityCode = json['identityCode'];
    vehicleNo = json['vehicleNo'];
    costDetail = json['costDetail'];
    feeType = json['feeType'];
    payeeName = json['payeeName'];
    payeeBankCard = json['payeeBankCard'];
    amount = json['amount'];
    withdrawalTime = json['withdrawalTime'];
    reviewState = json['reviewState'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    createTime = json['createTime'];
    entityId = json['entityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['withdrawalId'] = this.withdrawalId;
    data['withdrawalNo'] = this.withdrawalNo;
    data['businessNo'] = this.businessNo;
    data['userId'] = this.userId;
    data['identityCode'] = this.identityCode;
    data['vehicleNo'] = this.vehicleNo;
    data['costDetail'] = this.costDetail;
    data['feeType'] = this.feeType;
    data['payeeName'] = this.payeeName;
    data['payeeBankCard'] = this.payeeBankCard;
    data['amount'] = this.amount;
    data['withdrawalTime'] = this.withdrawalTime;
    data['reviewState'] = this.reviewState;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['createTime'] = this.createTime;
    data['entityId'] = this.entityId;
    return data;
  }
}

class User {
  String? userId;
  String? name;
  String? phone;
  String? balance;
  int? realNameState;
  int? faceState;
  int? vehicleState;
  int? userState;
  int? reviewState;
  String? createTime;
  String? entityId;

  User(
      {this.userId,
      this.name,
      this.phone,
      this.balance,
      this.realNameState,
      this.faceState,
      this.vehicleState,
      this.userState,
      this.reviewState,
      this.createTime,
      this.entityId});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    phone = json['phone'];
    balance = json['balance'];
    realNameState = json['realNameState'];
    faceState = json['faceState'];
    vehicleState = json['vehicleState'];
    userState = json['userState'];
    reviewState = json['reviewState'];
    createTime = json['createTime'];
    entityId = json['entityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['balance'] = this.balance;
    data['realNameState'] = this.realNameState;
    data['faceState'] = this.faceState;
    data['vehicleState'] = this.vehicleState;
    data['userState'] = this.userState;
    data['reviewState'] = this.reviewState;
    data['createTime'] = this.createTime;
    data['entityId'] = this.entityId;
    return data;
  }
}
