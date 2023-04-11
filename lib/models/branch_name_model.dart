class BranchNameModel {
  String? appId;
  String? tysjBankId;
  String? bankcard;
  String? openBank;
  String? branchName;
  String? bankcode;
  String? province;
  String? city;
  String? addr;
  String? entityId;
  String? createTime;

  BranchNameModel(
      {this.appId,
      this.tysjBankId,
      this.bankcard,
      this.openBank,
      this.branchName,
      this.bankcode,
      this.province,
      this.city,
      this.addr,
      this.entityId,
      this.createTime});

  BranchNameModel.fromJson(Map<String, dynamic> json) {
    appId = json['appId'];
    tysjBankId = json['tysjBankId'];
    bankcard = json['bankcard'];
    openBank = json['openBank'];
    branchName = json['branchName'];
    bankcode = json['bankcode'];
    province = json['province'];
    city = json['city'];
    addr = json['addr'];
    entityId = json['entityId'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appId'] = this.appId;
    data['tysjBankId'] = this.tysjBankId;
    data['bankcard'] = this.bankcard;
    data['openBank'] = this.openBank;
    data['branchName'] = this.branchName;
    data['bankcode'] = this.bankcode;
    data['province'] = this.province;
    data['city'] = this.city;
    data['addr'] = this.addr;
    data['entityId'] = this.entityId;
    data['createTime'] = this.createTime;
    return data;
  }
}