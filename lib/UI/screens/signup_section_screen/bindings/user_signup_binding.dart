import 'package:get/get.dart';
import 'package:demoapp/UI/screens/signup_section_screen/controllers/user_signup_screen_controller.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIProviders/otp_provider.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIRepository/otp_repository.dart';

class UserSignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IOtpProvider>(() => OtpProvider());
    Get.lazyPut(() => OtpRepository(provider: Get.find()));
    Get.lazyPut(() => UserSignUpScreenController(otpRepository: Get.find()));
  }
}
