import 'package:get/get.dart';
import 'package:demoapp/UI/screens/SelectUserTypeSection/controllers/login_controller.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIProviders/login_api_provider.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIRepository/login_api_repository.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILoginProvider>(() => LoginProvider());
    Get.put(LoginAPIRepository(provider: Get.find()));
    Get.lazyPut(() => LoginController(loginAPIRepository : Get.find()));
  }
}