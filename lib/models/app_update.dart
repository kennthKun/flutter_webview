class AppUpdate {
  String? configId;
  String? code;
  String? value;
  String? entityId;
  String? createTime;

  AppUpdate(
      {this.configId, this.code, this.value, this.entityId, this.createTime});

  AppUpdate.fromJson(Map<String, dynamic> json) {
    configId = json['configId'];
    code = json['code'];
    value = json['value'];
    entityId = json['entityId'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['configId'] = this.configId;
    data['code'] = this.code;
    data['value'] = this.value;
    data['entityId'] = this.entityId;
    data['createTime'] = this.createTime;
    return data;
  }
}