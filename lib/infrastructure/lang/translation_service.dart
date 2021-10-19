import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:demoapp/infrastructure/lang/ar.dart';
import 'package:demoapp/infrastructure/lang/en.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static final fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'English',
    'عربى',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    Locale('en', 'US'),
    Locale('ar', 'SA'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
    'en': en,
    'ar': ar,
  };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    //final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(Locale("$lang"));
  }

  // Finds language in `langs` list and returns it as Locale
  Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}