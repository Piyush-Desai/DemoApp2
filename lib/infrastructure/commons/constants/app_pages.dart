import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:demoapp/UI/screens/SelectUserTypeSection/bindings/login_verification_binding.dart';
import 'package:demoapp/UI/screens/SelectUserTypeSection/bindings/select_language_binding.dart';
import 'package:demoapp/UI/screens/SelectUserTypeSection/views/login_verification_screen.dart';
import 'package:demoapp/UI/screens/SelectUserTypeSection/views/select_language_screen.dart';
import 'package:demoapp/UI/screens/SelectUserTypeSection/bindings/login_binding.dart';
import 'package:demoapp/UI/screens/SelectUserTypeSection/bindings/select_user_type_binding.dart';
import 'package:demoapp/UI/screens/SelectUserTypeSection/views/log_in_screen.dart';
import 'package:demoapp/UI/screens/SelectUserTypeSection/views/select_user_type_screen.dart';
import 'package:demoapp/UI/screens/signup_section_screen/bindings/lawyer_signup_screen_binding.dart';
import 'package:demoapp/UI/screens/signup_section_screen/bindings/otp_verification_screen_binding.dart';
import 'package:demoapp/UI/screens/signup_section_screen/bindings/user_signup_binding.dart';
import 'package:demoapp/UI/screens/signup_section_screen/views/lawyer_signup_screen.dart';
import 'package:demoapp/UI/screens/signup_section_screen/views/otp_verification_screen.dart';
import 'package:demoapp/UI/screens/signup_section_screen/views/user_signup_screen.dart';
import 'package:demoapp/infrastructure/commons/constants/app_routes.dart';

class AppPages {
  static const INITIAL = RoutesConstants.selectLanguageScreen;

  final getStorage = GetStorage().obs;

  static final routes = [

    GetPage(
      name: RoutesConstants.selectLanguageScreen,
      page: () => SelectLanguageScreen(),
      binding: SelectLanguageBinding(),
      children: [
        GetPage(
          name: RoutesConstants.selectUserTypeScreen,
          page: () => SelectUserTypeScreen(),
          binding: SelectUserTypeBindings(),
          children: [
            GetPage(
              name: RoutesConstants.lawyerSignUpScreen,
              page: () => LawyerSignUpScreen(),
              binding: LawyerSignUpBinding(),
              children: [
                GetPage(
                  name: RoutesConstants.otpVerificationScreen,
                  page: () => OtpVerificationScreen(),
                  binding: OtpVerificationScreenBinding(),
                ),
              ],
            ),
            GetPage(
              name: RoutesConstants.userSignUpScreen,
              page: () => UserSignUpScreen(),
              binding: UserSignUpBinding(),
              children: [
                GetPage(
                  name: RoutesConstants.otpVerificationScreen,
                  page: () => OtpVerificationScreen(),
                  binding: OtpVerificationScreenBinding(),
                ),
              ],
            ),
            GetPage(
              name: RoutesConstants.loginScreen,
              page: () => LoginScreen(),
              binding: LoginBinding(),
              children: [
                GetPage(
                  name: RoutesConstants.loginVerifyScreen,
                  page: () => LoginVerificationScreen(),
                  binding: LoginVerificationBinding(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),

  ];

}
