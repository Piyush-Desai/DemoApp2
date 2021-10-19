import 'dart:convert';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:demoapp/UI/commons/InternationalPhoneInput/utils/phone_number.dart';
import 'package:demoapp/UI/screens/signup_section_screen/registration_data_store.dart';
import 'package:demoapp/infrastructure/commons/constants/app_routes.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIRepository/otp_repository.dart';
import 'package:demoapp/infrastructure/models/requests/otp_request_model.dart';
import 'package:demoapp/infrastructure/models/responses/otp_response_model.dart';
import 'package:demoapp/infrastructure/models/responses/user_registration_response_model.dart';
import 'package:sms_autofill/sms_autofill.dart';

class UserSignUpScreenController extends GetxController {
  Rx<OtpResponseModel> otpResponseModel = OtpResponseModel().obs;
  final OtpRepository otpRepository;

  UserSignUpScreenController({required this.otpRepository});

  final box = GetStorage();

  RxString countryCode = "33".obs;
  RxString alphaCode = "".obs;
  RxString realPhoneNumber = "".obs;
  Rx<PhoneNumber> number = PhoneNumber(dialCode: "33", isoCode: "FR").obs;
  RxBool validateValue = false.obs;
  final phoneNumberController = TextEditingController().obs;
  var focusPhoneNumber = FocusNode().obs;
  RxBool phoneErrorVisible = false.obs;

  final countryValue = RxnString();
  RxBool isCountrySelected = false.obs;
  RxBool isActive = false.obs;
  RxBool isVisible = false.obs;
  RxBool isValidPhone = false.obs;
  RxBool hasPhoneError = false.obs;
  RxString countryIsoCode = "IN".obs;
  RxString phoneNumber = "".obs;
  final formKey = GlobalKey<FormState>();
  String otpCode = "";

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode professionalDetailsFocusNode = FocusNode();
  RxBool autoValidate = false.obs;

  Rx<UserRegistrationResponseModel> registrationResponseModel =
      UserRegistrationResponseModel().obs;

  Future<void> onSubmit() async {
    if (formKey.currentState!.validate()) {}
    if (!validateValue.value) {
      phoneErrorVisible.value = true;
    } else {
      phoneErrorVisible.value = false;
    }

    if (formKey.currentState!.validate() && validateValue.value) {
      if (isActive.value) {
        await storeData();
        SmsAutoFill().listenForCode;
        await SmsAutoFill().getAppSignature;
        await getOtp();
      } else {
        Get.snackbar(
            "Note", "please accept the terms and conditions to register");
      }
    } else {
      autoValidate.value = true;
    }
  }

  void clearAll() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    phoneNumberController.value.clear();
  }

  Future<String> deviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id;
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor;
    }
  }

  getOtp() async {
    String phoneNo = phoneNumberController.value.text.replaceAll(" ", "");

    OtpRequestModel otpRequestModel = OtpRequestModel(
        phone: phoneNo.isNotEmpty ? "#$phoneNo" : "",
        countryCode: countryCode.value,
        isRegister: true);

    otpResponseModel.value =
        await otpRepository.getOtpResponse(jsonEncode(otpRequestModel));
    if (otpResponseModel.value.success!) {
      Get.rootDelegate.toNamed(
        "${RoutesConstants.selectUserTypeScreen}${RoutesConstants.userSignUpScreen}${RoutesConstants.otpVerificationScreen}",
      );
    } else {
      Get.snackbar("alert".tr, otpResponseModel.value.message!,
          backgroundColor: Colors.black87, colorText: Colors.white);
    }
  }

  storeData() async {
    RegistrationDataStoreModel dataStoreModel = RegistrationDataStoreModel(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      countryCode: countryIsoCode.value,
      phone: "#" + phoneNumberController.value.text,
    );
    box.write("user_data", dataStoreModel);
  }

  getPhoneNumber(String isoCode, String number) {
    countryIsoCode.value = isoCode;
    phoneNumber.value = number;
  }

  void changeIsVisible(bool visible) {
    isVisible.value = visible;
  }

  void changeIsCountrySelected(bool visible) {
    isCountrySelected.value = visible;
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

  void changeInitialVal(String? s) {
    countryValue.value = s!;
  }
}
