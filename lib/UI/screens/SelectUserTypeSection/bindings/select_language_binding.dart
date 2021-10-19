import 'package:get/get.dart';
import 'package:demoapp/UI/screens/SelectUserTypeSection/controllers/select_language_controller.dart';

class SelectLanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectLanguageController());
  }

}