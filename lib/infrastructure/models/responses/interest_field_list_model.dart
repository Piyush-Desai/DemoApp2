// To parse this JSON data, do
//
//     final interestFieldListModel = interestFieldListModelFromJson(jsonString);

import 'dart:convert';

InterestFieldResponseModel interestFieldListModelFromJson(String str) =>
    InterestFieldResponseModel.fromJson(json.decode(str));

String interestFieldListModelToJson(InterestFieldResponseModel data) =>
    json.encode(data.toJson());

class InterestFieldResponseModel {
  InterestFieldResponseModel({
    this.code,
    this.success,
    this.message,
    this.data,
    this.err,
    this.pagination,
  });

  int? code;
  bool? success;
  String? message;
  List<InterestFieldList>? data;
  Err? err;
  Pagination? pagination;

  factory InterestFieldResponseModel.fromJson(Map<String, dynamic> json) =>
      InterestFieldResponseModel(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data : json["data"] != null ?  List<InterestFieldList>.from(json["data"].map((x) => InterestFieldList.fromJson(x))) : [],
        err: Err.fromJson(json["err"]),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
        "data": List<InterestFieldList>.from(data!.map((x) => x.toJson())),
        "err": err!.toJson(),
        "pagination": pagination!.toJson(),
      };
}

class InterestFieldList {
  InterestFieldList(
      {this.fieldId,
      this.name,
      this.nameAr,
      this.color,
      this.image,
      this.status,
      this.isSelected});

  String? fieldId;
  String? name;
  String? nameAr;
  String? color;
  String? image;
  String? status;
  bool? isSelected ;

  factory InterestFieldList.fromJson(Map<String, dynamic> json) =>
      InterestFieldList(
        fieldId: json["field_id"],
        name: json["name"],
        nameAr: json["name_ar"],
        color: json["color"],
        image: json["image"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "field_id": fieldId,
        "name": name,
        "name_ar": nameAr,
        "color": color,
        "image": image,
        "status": status,
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

class Pagination {
  Pagination({
    this.nextPage,
    this.perPage,
    this.currentPage,
    this.count,
    this.total,
    this.totalPages,
  });

  int? nextPage;
  int? perPage;
  int? currentPage;
  int? count;
  int? total;
  int? totalPages;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        nextPage: json["next_page"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        count: json["count"],
        total: json["total"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "next_page": nextPage,
        "per_page": perPage,
        "current_page": currentPage,
        "count": count,
        "total": total,
        "total_pages": totalPages,
      };
}
