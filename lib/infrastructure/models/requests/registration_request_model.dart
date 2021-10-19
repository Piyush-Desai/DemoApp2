import 'dart:convert';

class RegistrationRequestModel {
  String? firstName;
  String? lastName;
  String? email;
  String? countryCode;
  String? phone;
  String? lang;
  String? type;
  String? language;
  String? fcm;
  List<String>? lawyerField;
  String? licenseNumber;
  String? licenseImage;
  String? deviceID;
  String? deviceType;
  String? otp;
  String? userClass;

  RegistrationRequestModel({
    this.firstName,
    this.lastName,
    this.email,
    this.countryCode,
    this.phone,
    this.lang,
    this.type,
    this.language,
    this.fcm,
    this.lawyerField,
    this.licenseNumber,
    this.licenseImage,
    this.deviceID,
    this.deviceType,
    this.otp,
    this.userClass,
  });

  RegistrationRequestModel.fromJson(Map<String, dynamic> json) {
    firstName = json["firstname"];
    lastName = json["lastname"];
    email = json["email"];
    countryCode = json["country_code"];
    phone = json["phone"];
    lang = json["lang"];
    type = json["type"];
    language = json["language"];
    fcm = json["fcm"];
    lawyerField = List<String>.from(json["lawyer_field"].map((x) => x));
    licenseNumber = json["license_number"];
    licenseImage = json["license_image"];
    deviceID = json["device_id"];
    deviceType = json["device_type"];
    otp = json["otp"];
    userClass = json["user_class"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this.firstName;
    data['lastname'] = this.lastName;
    data['email'] = this.email;
    data['country_code'] = this.countryCode;
    data['phone'] = this.phone;
    data['lang'] = this.lang;
    data['type'] = this.type;
    data['language'] = this.language;
    data['fcm'] = this.fcm;
    data['lawyer_field'] = List<dynamic>.from(lawyerField!.map((x) => x));
    data['license_number'] = this.licenseNumber;
    data['license_image'] = this.licenseImage;
    data['device_id'] = this.deviceID;
    data['device_type'] = this.deviceType;
    data['otp'] = this.otp;
    data['user_class'] = this.userClass;
    return data;
  }

  String prepareRequest(){
    return jsonEncode(toJson());
  }
}
