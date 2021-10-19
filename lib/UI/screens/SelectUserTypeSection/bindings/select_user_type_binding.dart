import 'package:get/get.dart';
import 'package:demoapp/UI/screens/SelectUserTypeSection/controllers/select_user_tyoe_controller.dart';

class SelectUserTypeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectUserTypeController());
  }

}