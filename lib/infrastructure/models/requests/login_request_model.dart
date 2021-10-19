class LoginRequestModel {
  String? countryCode;
  String? phone;

  LoginRequestModel({this.countryCode, this.phone});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    countryCode = json['country_code'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_code'] = this.countryCode;
    data['phone'] = this.phone;
    return data;
  }
}
