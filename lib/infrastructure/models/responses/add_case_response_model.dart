
// To parse this JSON data, do
//
//     final addCaseResponseModel = addCaseResponseModelFromJson(jsonString);

import 'dart:convert';

AddCaseResponseModel addCaseResponseModelFromJson(String str) => AddCaseResponseModel.fromJson(json.decode(str));

String addCaseResponseModelToJson(AddCaseResponseModel data) => json.encode(data.toJson());

class AddCaseResponseModel {
  AddCaseResponseModel({
    this.code,
    this.success,
    this.message,
    this.data,
    this.err,
  });

  int? code;
  bool? success;
  String? message;
  Data? data;
  Err? err;

  factory AddCaseResponseModel.fromJson(Map<String, dynamic> json) => AddCaseResponseModel(
    code: json["code"],
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
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

class Data {
  Data({
    this.caseId,
    this.userId,
    this.fieldId,
    this.title,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  String? caseId;
  String? userId;
  int? fieldId;
  String? title;
  String? description;
  String? status;
  String? createdAt;
  String? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    caseId: json["case_id"],
    userId: json["user_id"],
    fieldId: json["field_id"],
    title: json["title"],
    description: json["description"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "case_id": caseId,
    "user_id": userId,
    "field_id": fieldId,
    "title": title,
    "description": description,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Err {
  Err();

  factory Err.fromJson(Map<String, dynamic> json) => Err(
  );

  Map<String, dynamic> toJson() => {
  };
}
