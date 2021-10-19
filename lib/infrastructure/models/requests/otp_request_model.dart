// To parse this JSON data, do
//
//     final otpRequestModel = otpRequestModelFromJson(jsonString);

import 'dart:convert';

OtpRequestModel otpRequestModelFromJson(String str) => OtpRequestModel.fromJson(json.decode(str));

String otpRequestModelToJson(OtpRequestModel data) => json.encode(data.toJson());

class OtpRequestModel {
  OtpRequestModel({
    this.countryCode,
    this.phone,
    this.isRegister,
  });

  String? countryCode;
  String? phone;
  bool? isRegister;

  factory OtpRequestModel.fromJson(Map<String, dynamic> json) => OtpRequestModel(
    countryCode: json["country_code"],
    phone: json["phone"],
    isRegister: json["is_register"],
  );

  Map<String, dynamic> toJson() => {
    "country_code": countryCode,
    "phone": phone,
    "is_register": isRegister,
  };
}
