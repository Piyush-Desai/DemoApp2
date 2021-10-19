import 'package:flutter/cupertino.dart';

//define key used to navigate to routes...to be used globally
class Keys {
  static final navKey = GlobalKey<NavigatorState>();
}

class RoutesConstants {
  static const String splashScreen = "/";
  static const String selectLanguageScreen = "/selectLanguageScreen";
  static const String selectUserTypeScreen = "/selectUserTypeScreen";
  static const String loginScreen = "/loginScreen";
  static const String loginVerifyScreen = "/loginVerifyScreen";
  static const String lawyerSignUpScreen = "/lawyerSignUpScreen";
  static const String userSignUpScreen = "/userSignUpScreen";
  static const String otpVerificationScreen = "/otpVerificationScreen";

  static const String homeScreen = "/homeScreen";
  static const String notificationScreen = "/notificationScreen";
  static const String addScreen = "/addScreen";
  static const String settingsScreen = "/settingsScreen";
  static const String fontControlSettingsScreen = "/fontControlSettingsScreen";
  static const String notificationSettingsScreen = "/notificationSettingsScreen";
  static const String zoomInOutSettingsScreen = "/zoomInOutSettingsScreen";
  static const String tAndCSettingsScreen = "/tAndCSettingsScreen";
  static const String usagePrivacyPolicySettingsScreen = "/usagePrivacyPolicySettingsScreen";
  static const String profileScreen = "/profileScreen";
  static const String updateProfileScreen = "/updateProfileScreen";

  static const String bottomNavigationBarScreen = "/bottomNavigationBarScreen";

}
