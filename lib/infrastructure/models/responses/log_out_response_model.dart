import 'dart:convert';

LogOutResponseModel logOutResponseModelFromJson(String str) => LogOutResponseModel.fromJson(json.decode(str));

String logOutResponseModelToJson(LogOutResponseModel data) => json.encode(data.toJson());

class LogOutResponseModel {
  LogOutResponseModel({
    this.code,
    this.success,
    this.message,
    this.err,
  });

  int? code;
  bool? success;
  String? message;
  Err? err;

  factory LogOutResponseModel.fromJson(Map<String, dynamic> json) => LogOutResponseModel(
    code: json["code"],
    success: json["success"],
    message: json["message"],
    err: Err.fromJson(json["err"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "success": success,
    "message": message,
    "err": err!.toJson(),
  };
}

class Err {
  Err();

  factory Err.fromJson(Map<String, dynamic> json) => Err(
  );

  Map<String, dynamic> toJson() => {
  };
}
