import 'dart:convert';

LoginVerifyResponseModel loginVerifyResponseModelFromJson(String str) => LoginVerifyResponseModel.fromJson(json.decode(str));

String loginVerifyResponseModelToJson(LoginVerifyResponseModel data) => json.encode(data.toJson());

class LoginVerifyResponseModel {
  LoginVerifyResponseModel({
    this.code,
    this.success,
    this.message,
    this.data,
    this.err,
  });

  int? code;
  bool? success;
  String? message;
  LoginVerifyUserDataModel? data;
  Err? err;

  factory LoginVerifyResponseModel.fromJson(Map<String, dynamic> json) => LoginVerifyResponseModel(
    code: json["code"],
    success: json["success"],
    message: json["message"],
    data: LoginVerifyUserDataModel.fromJson(json["data"]),
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

class LoginVerifyUserDataModel {
  LoginVerifyUserDataModel({
    this.uId,
    this.firstName,
    this.lastName,
    this.email,
    this.countryCode,
    this.countryId,
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
    this.fields,
  });

  String? uId;
  String? firstName;
  String? lastName;
  String? email;
  String? countryCode;
  String? countryId;
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
  List<Field>? fields;

  factory LoginVerifyUserDataModel.fromJson(Map<String, dynamic> json) => LoginVerifyUserDataModel(
    uId: json["u_id"],
    firstName: json["firstname"],
    lastName: json["lastname"],
    email: json["email"],
    countryCode: json["country_code"],
    countryId: json["country_id"],
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
    fields: json["fields"] != null ? List<Field>.from(json["fields"].map((x) => Field.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "u_id": uId,
    "firstname": firstName,
    "lastname": lastName,
    "email": email,
    "country_code": countryCode,
    "country_id": countryId,
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
    "fields": List<dynamic>.from(fields!.map((x) => x.toJson())),
  };
}

class Field {
  Field({
    this.fieldId,
    this.name,
    this.nameAr,
    this.color,
    this.image,
    this.status,
  });

  String? fieldId;
  String? name;
  String? nameAr;
  String? color;
  String? image;
  String? status;

  factory Field.fromJson(Map<String, dynamic> json) => Field(
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
  Err();

  factory Err.fromJson(Map<String, dynamic> json) => Err(
  );

  Map<String, dynamic> toJson() => {
  };
}
