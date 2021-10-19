// To parse this JSON data, do
//
//     final userRegistrationRequestModel = userRegistrationRequestModelFromJson(jsonString);

import 'dart:convert';

UserRegistrationRequestModel userRegistrationRequestModelFromJson(String str) => UserRegistrationRequestModel.fromJson(json.decode(str));

String userRegistrationRequestModelToJson(UserRegistrationRequestModel data) => json.encode(data.toJson());

class UserRegistrationRequestModel {
  UserRegistrationRequestModel({
    this.firstName,
    this.lastName,
    this.email,
    this.countryCode,
    this.phone,
    this.lang,
    this.type,
    this.language,
    this.fcm,
    this.deviceId,
    this.deviceType,
    this.otp,
  });

  String? firstName;
  String? lastName;
  String? email;
  String? countryCode;
  String? phone;
  String? lang;
  String? type;
  String? language;
  String? fcm;
  String? deviceId;
  String? deviceType;
  String? otp;

  factory UserRegistrationRequestModel.fromJson(Map<String, dynamic> json) => UserRegistrationRequestModel(
    firstName: json["firstname"],
    lastName: json["lastname"],
    email: json["email"],
    countryCode: json["country_code"],
    phone: json["phone"],
    lang: json["lang"],
    type: json["type"],
    language: json["language"],
    fcm: json["fcm"],
    deviceId: json["device_id"],
    deviceType: json["device_type"],
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstName,
    "lastname": lastName,
    "email": email,
    "country_code": countryCode,
    "phone": phone,
    "lang": lang,
    "type": type,
    "language": language,
    "fcm": fcm,
    "device_id": deviceId,
    "device_type": deviceType,
    "otp": otp,
  };
}
