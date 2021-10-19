import 'package:flutter/material.dart';

/// A [Country] model represents an instance of a country which contains
/// information about the country
class Country {
  /*/// The name of the [Country]
  final String? name;

  /// The alpha 2 isoCode of the [Country]
  final String? alpha2Code;

  /// The alpha 3 isoCode of the [Country]
  final String? alpha3Code;

  /// The dialCode of the [Country]
  final String? dialCode;

  /// The flagUri which links to the flag for the [Country] in the library assets
  final String flagUri;

  /// The nameTranslation for translation
  final Map<String, String>? nameTranslations;*/

  /// The country_id of the [Country]
  final String? countryId;

  /// The static_id of the [Country]
  final int? staticId;

  /// The name of the [Country]
  final String? name;

  /// The arabic name of the [Country]
  final String? nameAr;

  /// The country_code of the [Country]
  final String? countryCode;

  /// The phone_code of the [Country]
  final String? phoneCode;

  /// The image of the [Country]
  final String? image;

  /// The image of the [Country]
  final String? status;

  Country({this.countryId, this.staticId, this.name, this.nameAr, this.countryCode, this.phoneCode, this.image, this.status, }
    /*required this.name,
    required this.alpha2Code,
    required this.alpha3Code,
    required this.dialCode,
    required this.flagUri,
    this.nameTranslations,*/
  );

  /// Convert [Countries.countryList] to [Country] model
  factory Country.fromJson(Map<String, dynamic> data) {
    return Country(
      countryId: data['country_id'],
      staticId: data['static_id'],
      name: data['name'],
      nameAr: data['name_ar'],
      countryCode: data['country_code'],
      phoneCode: data['phone_code'],
      image: data['image'],
      status: data['status'],
      /*name: data['en_short_name'],
      alpha2Code: data['alpha_2_code'],
      alpha3Code: data['alpha_3_code'],
      dialCode: data['dial_code'],
      flagUri: 'assets/flags/${data['alpha_2_code'].toLowerCase()}.png',
      nameTranslations: data['nameTranslations'] != null
          ? Map<String, String>.from(data['nameTranslations'])
          : null,*/
    );
  }

  @override
  bool operator ==(Object other) {
    return other is Country &&
        other.countryId == countryId &&
        other.staticId == staticId &&
        other.name == name &&
        other.nameAr == nameAr &&
        other.countryCode == countryCode &&
        other.phoneCode == phoneCode &&
        other.image == image &&
        other.status == status;
        /*other.alpha2Code == this.alpha2Code &&
        other.alpha3Code == this.alpha3Code &&
        other.dialCode == this.dialCode;*/
  }

  @override
  int get hashCode => hashValues(countryId, staticId, name, nameAr, countryCode, phoneCode, image, status/*alpha2Code, alpha3Code, dialCode*/);

  @override
  String toString() => '[Country] { '
  'country_id : $countryId,'
  'static_id : $staticId,'
  'name : $name,'
  'name_ar : $nameAr,'
  'country_code : $countryCode,'
  'phone_code : $phoneCode,'
  'image : $image,'
  'status : $status'
  '}';








      /*'name: $name, '
      'alpha2: $alpha2Code, '
      'alpha3: $alpha3Code, '
      'dialCode: $dialCode '
      '}';*/
}