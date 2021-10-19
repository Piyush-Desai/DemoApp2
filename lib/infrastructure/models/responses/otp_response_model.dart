// To parse this JSON data, do
//
//     final otpResponseModel = otpResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:demoapp/infrastructure/models/responses/error_code.dart';

OtpResponseModel otpResponseModelFromJson(String str) => OtpResponseModel.fromJson(json.decode(str));

String otpResponseModelToJson(OtpResponseModel data) => json.encode(data.toJson());

class OtpResponseModel {
  OtpResponseModel({
    this.code,
    this.success,
    this.message,
    this.data,
  });

  int? code;
  bool? success;
  String? message;
  Data? data;

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) => OtpResponseModel(
    code: json["code"],
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "success": success,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.otp,
  });

  String? otp;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "otp": otp,
  };
}

//Error();