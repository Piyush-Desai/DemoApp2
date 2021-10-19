import 'package:get/get.dart';
import 'package:demoapp/UI/screens/signup_section_screen/controllers/lawyer_signup_screen_controller.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIProviders/interest_field_list_provider.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIProviders/lawyer_signup_provider.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIProviders/otp_provider.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIRepository/interest_field_list_repository.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIRepository/lawyer_signup_repository.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIRepository/otp_repository.dart';

class LawyerSignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IInterestFieldListProvider>(() => InterestFieldListProvider());
    Get.lazyPut(() => InterestFieldListRepository(provider: Get.find()));
    Get.lazyPut<IOtpProvider>(() => OtpProvider());
    Get.lazyPut(() => OtpRepository(provider: Get.find()));
    Get.lazyPut<ILawyerSignupProvider>(() => LawyerSignupProvider());
    Get.put(LawyerSignupRepository(provider: Get.find()));
    Get.lazyPut(() => LawyerSignUpScreenController(
          otpRepository: Get.find(),
          lawyerSignupRepository: Get.find(),
          interestFieldListRepository: Get.find(),
        ));
  }
}
