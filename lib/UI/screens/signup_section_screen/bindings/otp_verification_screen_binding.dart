import 'package:get/get.dart';
import 'package:demoapp/UI/screens/signup_section_screen/controllers/otp_verification_screen_controller.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIProviders/lawyer_signup_provider.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIProviders/user_signup_provider.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIRepository/lawyer_signup_repository.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIRepository/user_signup_repository.dart';

class OtpVerificationScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILawyerSignupProvider>(
      () => LawyerSignupProvider(),
    );
    Get.put(LawyerSignupRepository(provider: Get.find()));

    Get.lazyPut<IUserSignUpProvider>(() => UserSignUpProvider());
    Get.put(UserSignUpRepository(provider: Get.find()));

    Get.lazyPut(() => OtpVerificationScreenController(
          lawyerSignupRepository: Get.find(),
          userSignupRepository: Get.find(),
        ));
  }
}
