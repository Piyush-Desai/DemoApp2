import 'package:get/get.dart';
import 'package:demoapp/UI/screens/SelectUserTypeSection/controllers/login_verification_controller.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIProviders/login_api_provider.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIProviders/login_otp_api_provider.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIRepository/login_api_repository.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIRepository/login_otp_api_repository.dart';

class LoginVerificationBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ILoginOTPProvider>(() => LoginOTPProvider());
    Get.lazyPut<ILoginProvider>(() => LoginProvider());
    Get.put(LoginOTPAPIRepository(provider: Get.find()));
    Get.put(LoginAPIRepository(provider: Get.find()));
    Get.lazyPut(() => LoginVerificationController(loginOTPAPIRepository: Get.find(), loginAPIRepository: Get.find()));
  }

}