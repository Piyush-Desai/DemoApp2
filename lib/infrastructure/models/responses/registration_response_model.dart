import 'dart:convert';

RegistrationResponseModel registrationResponseModelFromJson(String str) => RegistrationResponseModel.fromJson(json.decode(str));

String registrationResponseModelToJson(RegistrationResponseModel data) => json.encode(data.toJson());

class RegistrationResponseModel {
  RegistrationResponseModel({
    this.code,
    this.success,
    this.message,
    this.data,
    this.err,
  });

  int? code;
  bool? success;
  String? message;
  LawyerData? data;
  Err? err;

  factory RegistrationResponseModel.fromJson(Map<String, dynamic> json) => RegistrationResponseModel(
    code: json["code"],
    success: json["success"],
    message: json["message"],
    data: LawyerData.fromJson(json["data"]),
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

class LawyerData {
  LawyerData({
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
    this.fields,
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
  List<Fields>? fields;

  factory LawyerData.fromJson(Map<String, dynamic> json) => LawyerData(
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
    fields: json["fields"] != null ? List<Fields>.from(json["fields"].map((x) => Fields.fromJson(x))) : [],
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
    "fields": List<dynamic>.from(fields!.map((x) => x.toJson())),
  };
}

class Fields {
  Fields({
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

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
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


/*class RegistrationResponseModel {
  int? code;
  bool? success;
  String? message;
  UserData? data;

  RegistrationResponseModel({this.code, this.success, this.message, this.data});

  RegistrationResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserData {
  String? uId;
  String? name;
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
  String? updaredAt;
  String? userClass;
  List<Fields>? fields;

  UserData(
      {this.uId,
        this.name,
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
        this.updaredAt,
        this.userClass,
        this.fields});

  UserData.fromJson(Map<String, dynamic> json) {
    uId = json['u_id'];
    name = json['name'];
    email = json['email'];
    countryCode = json['country_code'];
    countryId = json['country_id'];
    phone = json['phone'];
    lang = json['lang'];
    type = json['type'];
    language = json['language'];
    licenseNumber = json['license_number'];
    licenseImage = json['license_image'];
    isNotifiable = json['is_notifiable'];
    createdAt = json['created_at'];
    updaredAt = json['updared_at'];
    userClass = json['UserClass'];
    fields = json["fields"] != null ?  List<Fields>.from(json["fields"].map((x) => Fields.fromJson(x))) : [];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['u_id'] = this.uId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['country_code'] = this.countryCode;
    data['country_id'] = this.countryId;
    data['phone'] = this.phone;
    data['lang'] = this.lang;
    data['type'] = this.type;
    data['language'] = this.language;
    data['license_number'] = this.licenseNumber;
    data['license_image'] = this.licenseImage;
    data['is_notifiable'] = this.isNotifiable;
    data['created_at'] = this.createdAt;
    data['updared_at'] = this.updaredAt;
    data['UserClass'] = this.userClass;
    if (this.fields != null) {
      data['fields'] = this.fields!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Fields {
  String? fieldId;
  String? name;
  String? nameAr;
  String? color;
  String? image;
  String? status;

  Fields(
      {this.fieldId,
        this.name,
        this.nameAr,
        this.color,
        this.image,
        this.status});

  Fields.fromJson(Map<String, dynamic> json) {
    fieldId = json['field_id'];
    name = json['name'];
    nameAr = json['name_ar'];
    color = json['color'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['field_id'] = this.fieldId;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['color'] = this.color;
    data['image'] = this.image;
    data['status'] = this.status;
    return data;
  }
}*/

