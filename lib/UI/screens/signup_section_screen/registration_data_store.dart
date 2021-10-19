class RegistrationDataStoreModel {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? countryCode;
  final String? phone;
  final List<String>? lawyerField;
  final String? licenseNumber;
  final String? licenseImage;
  final String? userClass;


  RegistrationDataStoreModel({this.firstName,
    this.lastName,
    this.email,
    this.countryCode,
    this.phone,
    this.lawyerField,
    this.licenseNumber,
    this.licenseImage,
    this.userClass,
  });

  Map<String,dynamic> toJson() =>
      {
        'firstname': firstName,
        'lastname': lastName,
        'email': email,
        'country_code': countryCode,
        'phone': phone,
        'lawyer_field': lawyerField,
        'license_number': licenseNumber,
        'license_image': licenseImage,
        'usr_class' : userClass,

      };

}
