import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:demoapp/infrastructure/commons/constants/storage_constants.dart';
import 'package:demoapp/infrastructure/lang/translation_service.dart';

class SelectLanguageController extends GetxController {

  final dataDocument = GetStorage().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  setLanguageLocale({required String languageLocale}) async {
    await dataDocument.value.write(StorageConstants.LanguageLocaleCode, languageLocale);
    TranslationService().changeLocale(languageLocale);
  }

  setFirstVisiBool({required bool firstVisit}) async {

    await dataDocument.value.write(StorageConstants.VisitBoolean, firstVisit);

  }


}