import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:demoapp/UI/commons/InternationalPhoneInput/utils/phone_number.dart';
import 'package:demoapp/UI/screens/signup_section_screen/registration_data_store.dart';
import 'package:demoapp/infrastructure/commons/constants/app_routes.dart';
import 'package:demoapp/infrastructure/commons/constants/storage_constants.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIRepository/interest_field_list_repository.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIRepository/lawyer_signup_repository.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIRepository/otp_repository.dart';
import 'package:demoapp/infrastructure/models/requests/otp_request_model.dart';
import 'package:demoapp/infrastructure/models/responses/interest_field_list_model.dart';
import 'package:demoapp/infrastructure/models/responses/otp_response_model.dart';
import 'package:demoapp/infrastructure/models/responses/registration_response_model.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

class LawyerSignUpScreenController extends GetxController {
  final LawyerSignupRepository lawyerSignupRepository;
  final InterestFieldListRepository interestFieldListRepository;
  final OtpRepository otpRepository;
  Rx<GetStorage> getStorage = GetStorage().obs;

  var autoValidate = false.obs;

  LawyerSignUpScreenController(
      {required this.otpRepository,
      required this.lawyerSignupRepository,
      required this.interestFieldListRepository});

  RegistrationDataStoreModel dataStoreModel = RegistrationDataStoreModel();

  RxString countryCode = "33".obs;
  RxString alphaCode = "".obs;
  RxString realPhoneNumber = "".obs;
  Rx<PhoneNumber> number = PhoneNumber(dialCode: "33", isoCode: "FR").obs;
  RxBool validateValue = false.obs;
  final phoneNumberController = TextEditingController().obs;
  var focusPhoneNumber = FocusNode().obs;

  final selectedCountryValue = Rxn<String>();
  RxBool isCountrySelected = false.obs;
  RxBool isPreferredLanguageSelected = false.obs;
  RxBool isDisplayCaseSelected = false.obs;
  final selectedPreferredLanguage = Rxn<String>();
  final selectedDisplayCases = Rxn<String>();
  final apiDisplayCases = Rxn<String>();
  RxString selectInterestFieldValue = "selectCountry".tr.obs;

  RxBool isActive = false.obs;
  RxBool isVisible = false.obs;
  RxBool isSubmit = false.obs;
  RxBool isValidPhone = false.obs;
  RxBool phoneErrorVisible = false.obs;
  RxBool hasPhoneError = false.obs;
  var imageFile;
  RxString imgUrl = "".obs;
  var picker = ImagePicker();

  String otpCode = "";

  List<Asset> imagesList = <Asset>[];
  RxList<File> allImages = <File>[].obs;
  RxBool isImagesLengthZero = true.obs;
  RxBool licenceValidationBool = false.obs;
  RxString countryIsoCode = "IN".obs;
  RxString phoneNumber = "".obs;
  final formKey = GlobalKey<FormState>();

  RxBool isLengthZero = false.obs;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController professionalDetailsController = TextEditingController();
  TextEditingController licenceNumberController = TextEditingController();

  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode professionalDetailsFocusNode = FocusNode();
  FocusNode licenceNumberFocusNode = FocusNode();

  RxList<InterestFieldList> interestFieldDataModelList =
      <InterestFieldList>[].obs;
  RxList<InterestFieldList> interestFieldList = <InterestFieldList>[].obs;
  List<String> idInterestFieldList = <String>[];

  Rx<RegistrationResponseModel> registrationResponseModel =
      RegistrationResponseModel().obs;

  Rx<InterestFieldResponseModel> interestFieldListModel =
      InterestFieldResponseModel().obs;

  Rx<OtpResponseModel> otpResponseModel = OtpResponseModel().obs;

  @override
  void onInit() {
    getInterestField();
    super.onInit();
  }

  clearAll() async {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    phoneNumberController.value.clear();
    interestFieldList.clear();
    professionalDetailsController.clear();
    licenceNumberController.clear();
    isImagesLengthZero.value = false;
    allImages.clear();
    await setInterestFieldAllUnSelect();
  }

  String convertImageToBase64(File imageFile) {
    final imageBytes = imageFile.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }

  getInterestField() async {
    interestFieldListModel.value =
        (await interestFieldListRepository.getInterestFieldListResponse());

    if (interestFieldListModel.value.success!) {
      interestFieldDataModelList.value = interestFieldListModel.value.data!;
    } else {
      Get.snackbar("alert".tr, interestFieldListModel.value.message!,
          backgroundColor: Colors.black87, colorText: Colors.white);
    }
    update();
  }

  getOtpApi() async {
    String phoneNo = phoneNumberController.value.text.replaceAll(" ", "");

    try {
      OtpRequestModel otpRequestModel = OtpRequestModel(
          phone: phoneNo.isNotEmpty ? "#$phoneNo" : "",
          countryCode: countryCode.value,
          isRegister: true);

      otpResponseModel.value =
          await otpRepository.getOtpResponse(jsonEncode(otpRequestModel));
      if (otpResponseModel.value.success!) {
        bool checkPhoneNumber =
            otpRequestModel.phone.toString().startsWith("#");

        if (checkPhoneNumber) {
          await getStorage.value
              .write(StorageConstants.checkPhoneNumberIsTest, checkPhoneNumber);
          await getStorage.value.write(
              StorageConstants.testOTP, otpResponseModel.value.data!.otp);

          Get.rootDelegate.toNamed(
            "${RoutesConstants.selectUserTypeScreen}${RoutesConstants.lawyerSignUpScreen}${RoutesConstants.otpVerificationScreen}",
          );
        } else {
          Get.rootDelegate.toNamed(
            "${RoutesConstants.selectUserTypeScreen}${RoutesConstants.lawyerSignUpScreen}${RoutesConstants.otpVerificationScreen}",
          );
        }
        update();
      } else {
        Get.snackbar("alert".tr, otpResponseModel.value.message!,
            backgroundColor: Colors.black87, colorText: Colors.white);
      }
    } catch (e) {
      rethrow;
    }
  }

  validateOtp(pin) {
    otpCode = pin;
    update();
  }

  void setSelectedItem({InterestFieldList? item}) {
    if (item!.isSelected ?? false) {
      item.isSelected = false;
    } else {
      item.isSelected = true;
    }
    update();
  }

  void addSelectedInterestFieldValue(List<InterestFieldList> selectedItem) {
    for (var element in selectedItem) {
      if (element.isSelected == null) {
        element.isSelected = false;
      } else {
        if (element.isSelected!) {
          interestFieldList.value.add(element);
          idInterestFieldList.add(element.fieldId!);
        }
      }
    }
    update();
  }

  Future<void> onSubmit() async {
    isSubmit.value = true;
    if (formKey.currentState!.validate()) {}

    if (!validateValue.value) {
      phoneErrorVisible.value = true;
    } else {
      phoneErrorVisible.value = false;
    }
    if (interestFieldList.isEmpty) {
      changeIsLengthZero(true);
    } else {
      changeIsLengthZero(false);
    }
    if (selectedPreferredLanguage.value == null) {
      changeIsPreferredLanguageSelected(true);
    } else {
      changeIsPreferredLanguageSelected(false);
    }
    if (selectedDisplayCases.value == null) {
      changeDisplayCasesSelected(true);
    } else {
      changeDisplayCasesSelected(false);
    }
    if (licenceNumberController.text.isEmpty) {
      licenceValidation(true);
    } else {
      licenceValidation(false);
    }

    if (allImages.isEmpty) {
      changeIsImageLengthZero(true);
    } else {
      changeIsImageLengthZero(false);
    }

    if (formKey.currentState!.validate() &&
        interestFieldList.isNotEmpty &&
        selectedPreferredLanguage.value != null &&
        validateValue.value &&
        allImages.isNotEmpty) {
      if (isActive.value) {
        await storeData();
        SmsAutoFill().listenForCode;
        await SmsAutoFill().getAppSignature;
        //await getOtpApi();
      } else {
        Get.snackbar(
            "Note", "please accept the terms and conditions to register");
      }
    } else {
      autoValidate.value = true;
    }
  }

  storeData() {
    String image = convertImageToBase64(allImages[0].absolute);
    RegistrationDataStoreModel dataStoreModel = RegistrationDataStoreModel(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      licenseNumber: licenceNumberController.text.trim(),
      countryCode: countryIsoCode.value,
      phone: "#" + phoneNumberController.value.text,
      licenseImage: image,
      lawyerField: idInterestFieldList,
      userClass: apiDisplayCases.value,
    );
    getStorage.value.write("lawyer_data", dataStoreModel);
  }

  void removeItem(int index) {
    interestFieldList[index].isSelected = false;
    interestFieldList.removeAt(index);
    idInterestFieldList.removeAt(index);
    update();
  }

  void changeIsLengthZero(bool isZero) {
    isLengthZero.value = isZero;
  }

  getPhoneNumber(String isoCode, String number, String dialCode) {
    countryIsoCode.value = isoCode;
    phoneNumber.value = number.toString().replaceAll(dialCode, "");
  }

  void changeIsImageLengthZero(bool isZero) {
    isImagesLengthZero.value = isZero;
  }

  void licenceValidation(bool isZero) {
    licenceValidationBool.value = isZero;
  }

  void changeIsPreferredLanguageSelected(bool visible) {
    isPreferredLanguageSelected.value = visible;
  }

  void changeDisplayCasesSelected(bool visible) {
    isDisplayCaseSelected.value = visible;
  }

  void changeIsCountrySelected(bool visible) {
    isCountrySelected.value = visible;
  }

  void changeIsVisible(bool visible) {
    isVisible.value = visible;
  }

  void phoneValidator(bool value) {
    isValidPhone.value = value;
  }

  void hasPhoneErrorText(bool value) {
    hasPhoneError.value = value;
  }

  void changeIsActive() {
    isActive.value = !isActive.value;
  }

  void changeCountryValue(String? s) {
    selectedCountryValue.value = s!;
  }

  void changeSelectInterestFieldValue(String? s) {
    selectInterestFieldValue.value = s!;
  }

  void changePreferredLanguage(String? s) {
    log("selectedPreferredLanguage : $selectedPreferredLanguage");
    selectedPreferredLanguage.value = s!;
  }

  void changeDisplayCases(String? s) {
    log("selectedDisplayCases : $selectedDisplayCases");
    selectedDisplayCases.value = s!;

    if (selectedDisplayCases.value == "As soon as published") {
      apiDisplayCases.value = "E";
    } else if (selectedDisplayCases.value == "After 1 day") {
      apiDisplayCases.value = "A";
    } else if (selectedDisplayCases.value == "After 2 day") {
      apiDisplayCases.value = "B";
    } else if (selectedDisplayCases.value == "After 3 day") {
      apiDisplayCases.value = "C";
    } else if (selectedDisplayCases.value == "After 4 day") {
      apiDisplayCases.value = "D";
    }
  }

  Future<void> getImage(ImageSource source) async {
    final pickedImage = await picker.pickImage(source: source);
    imageFile = File(pickedImage!.path);

    update();
  }

  removeImage() {
    imageFile = null;
    isImagesLengthZero.value = true;
    update();
  }

  Future<void> takePhoto(ImageSource source) async {
    final pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      imageFile = File(pickedImage.path);

      allImages.add(imageFile);
      isImagesLengthZero.value = false;
    }
  }

  Future<void> pickImages() async {
    List<Asset> resultList = <Asset>[];
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 1,
        enableCamera: true,
        selectedAssets: imagesList,
      );
      isImagesLengthZero.value = false;
      await convertAssetsToFile(resultList: resultList);
    } on Exception catch (e) {
      log("error : $e");
    }
  }

  convertAssetsToFile({required List<Asset> resultList}) async {
    List<File> fileList = [];

    for (int i = 0; i < resultList.length; i++) {
      final byteData = await resultList[i].getByteData();
      final tempFile =
          File("${(await getTemporaryDirectory()).path}/${resultList[i].name}");
      final file = await tempFile.writeAsBytes(
        byteData.buffer
            .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
      );
      fileList.add(file);
    }
    allImages.addAll(fileList);
  }

  void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  saveLanguageLocale(String languageLocale) async {
    await getStorage.value
        .write(StorageConstants.LanguageLocaleCode, languageLocale);
  }

  String getInterestFieldName(
      {required Rx<InterestFieldList> interestFieldList}) {
    GetStorage getStorage = GetStorage();

    String? currentLocale =
        getStorage.read(StorageConstants.LanguageLocaleCode);

    if (currentLocale != null) {
      if (currentLocale == "en") {
        return interestFieldList.value.name!;
      } else {
        return interestFieldList.value.nameAr!;
      }
    } else {
      return interestFieldList.value.name!;
    }
  }

  setInterestFieldAllUnSelect() {
    for (var element in interestFieldDataModelList.value) {
      if (element.isSelected == null) {
        element.isSelected = false;
      } else {
        if (element.isSelected!) {
          element.isSelected = false;
        }
      }
    }
    update();
  }
}
