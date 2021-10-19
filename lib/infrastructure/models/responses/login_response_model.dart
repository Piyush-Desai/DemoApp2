import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    this.code,
    this.success,
    this.message,
    this.data,
    this.err,
  });

  int? code;
  bool? success;
  String? message;
  OTPData? data;
  Err? err;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    code: json["code"],
    success: json["success"],
    message: json["message"],
    data: OTPData.fromJson(json["data"]),
    err: Err.fromJson(json["err"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "success": success,
    "message": message,
    "data": data!.toJson(),
    "err": err!.toJson(),
  };
}

class OTPData {
  OTPData({
    this.otp,
  });

  String? otp;

  factory OTPData.fromJson(Map<String, dynamic> json) => OTPData(
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "otp": otp,
  };
}

class Err {
  Err();

  factory Err.fromJson(Map<String, dynamic> json) => Err(
  );

  Map<String, dynamic> toJson() => {
  };
}
