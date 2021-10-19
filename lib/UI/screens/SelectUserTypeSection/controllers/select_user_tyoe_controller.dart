import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:demoapp/infrastructure/commons/constants/storage_constants.dart';
import 'package:demoapp/infrastructure/lang/translation_service.dart';

class SelectUserTypeController extends GetxController {
  RxString selectedLanguage = "".obs;
  RxString dropdownValue = "".obs;
  Rx<GetStorage> getStorage = GetStorage().obs;

  void changeLocale(String newLocale) {
    TranslationService().changeLocale(newLocale);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("object select user Type");
    FirebaseMessaging.instance.getToken().then((token) {
      print("device token: $token");
    });

    setDropDownValue();
  }

  saveLanguageLocale(String languageLocale) async {
    await getStorage.value
        .write(StorageConstants.LanguageLocaleCode, languageLocale);
  }

  saveUserType({required String userType}) async {
    await getStorage.value.write(StorageConstants.UserTypeKey, userType);
  }

  setDropDownValue() {
    String? currentLocale =
        getStorage.value.read(StorageConstants.LanguageLocaleCode);

    if (currentLocale != null) {
      if (currentLocale == "en") {
        dropdownValue.value = "English";
      } else {
        dropdownValue.value = "عربي";
      }
    } else {
      dropdownValue.value = "English";
    }
  }
}
