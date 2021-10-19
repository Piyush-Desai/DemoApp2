// To parse this JSON data, do
//
//     final userRegistrationResponseModel = userRegistrationResponseModelFromJson(jsonString);

import 'dart:convert';

UserRegistrationResponseModel userRegistrationResponseModelFromJson(String str) => UserRegistrationResponseModel.fromJson(json.decode(str));

String userRegistrationResponseModelToJson(UserRegistrationResponseModel data) => json.encode(data.toJson());

class UserRegistrationResponseModel {
  UserRegistrationResponseModel({
    this.code,
    this.success,
    this.message,
    this.data,
    this.err,
  });

  int? code;
  bool? success;
  String? message;
  UserData? data;
  Err? err;

  factory UserRegistrationResponseModel.fromJson(Map<String, dynamic> json) => UserRegistrationResponseModel(
    code: json["code"],
    success: json["success"],
    message: json["message"],
    data: json["data"] != null ? UserData.fromJson(json["data"]) : UserData(),
    err: json["err"] != null ?  Err.fromJson(json["err"]) : Err(),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "success": success,
    "message": message,
    "data": data!.toJson(),
    "err": err!.toJson(),
  };
}

class UserData {
  UserData({
    this.uId,
    this.firstName,
    this.lastName,
    this.email,
    this.countryCode,
    this.phone,
    this.lang,
    this.type,
    this.language,
    this.licenseNumber,
    this.licenseImage,
    this.isNotifiable,
    this.createdAt,
    this.updatedAt,
    this.userClass,
  });

  String? uId;
  String? firstName;
  String? lastName;
  String? email;
  String? countryCode;
  String? phone;
  String? lang;
  String? type;
  String? language;
  String? licenseNumber;
  String? licenseImage;
  int? isNotifiable;
  String? createdAt;
  String? updatedAt;
  String? userClass;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    uId: json["u_id"],
    firstName: json["firstname"],
    lastName: json["lastname"],
    email: json["email"],
    countryCode: json["country_code"],
    phone: json["phone"],
    lang: json["lang"],
    type: json["type"],
    language: json["language"],
    licenseNumber: json["license_number"],
    licenseImage: json["license_image"],
    isNotifiable: json["is_notifiable"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    userClass: json["user_class"],
  );

  Map<String, dynamic> toJson() => {
    "u_id": uId,
    "firstname": firstName,
    "lastname": lastName,
    "email": email,
    "country_code": countryCode,
    "phone": phone,
    "lang": lang,
    "type": type,
    "language": language,
    "license_number": licenseNumber,
    "license_image": licenseImage,
    "is_notifiable": isNotifiable,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "user_class": userClass,
  };
}

class Err {
  Err({
    this.code,
    this.type,
    this.description,
  });

  String? code;
  String? type;
  String? description;

  factory Err.fromJson(Map<String, dynamic> json) => Err(
    code: json["code"],
    type: json["type"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "type": type,
    "description": description,
  };
}
