import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:demoapp/UI/commons/InternationalPhoneInput/utils/phone_number.dart';
import 'package:demoapp/infrastructure/commons/constants/app_routes.dart';
import 'package:demoapp/infrastructure/commons/constants/storage_constants.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIRepository/login_api_repository.dart';
import 'package:demoapp/infrastructure/models/responses/login_response_model.dart';
import 'package:sms_autofill/sms_autofill.dart';

class LoginController extends GetxController {
  RxString countryCode = "33".obs;
  RxString appSignature = "".obs;
  RxString alphaCode = "".obs;
  RxString realPhoneNumber = "".obs;
  Rx<PhoneNumber> number = PhoneNumber(dialCode: "33", isoCode: "FR").obs;
  RxBool validateValue = false.obs;
  final phoneNumberController = TextEditingController().obs;
  var focusPhoneNumber = FocusNode().obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  final LoginAPIRepository loginAPIRepository;
  Rx<GetStorage> dataDocument = GetStorage().obs;

  var isTest = false.obs;

  LoginController({required this.loginAPIRepository});

  callLoginAPI({required String loginRequestJson}) async {
    loginResponseModel =
        (await loginAPIRepository.getLoginAPIResponse(loginRequestJson)).obs;

    if (loginResponseModel.value.success!) {
      bool checkPhoneNumber =
          jsonDecode(loginRequestJson)["phone"].toString().startsWith("#");

      if (checkPhoneNumber) {
        await dataDocument.value
            .write(StorageConstants.checkPhoneNumberIsTest, checkPhoneNumber);
        await dataDocument.value.write(
            StorageConstants.testOTP, loginResponseModel.value.data!.otp);

        Get.rootDelegate.toNamed(
            "${RoutesConstants.selectUserTypeScreen}${RoutesConstants.loginScreen}${RoutesConstants.loginVerifyScreen}");
      } else {
        Get.rootDelegate.toNamed(
            "${RoutesConstants.selectUserTypeScreen}${RoutesConstants.loginScreen}${RoutesConstants.loginVerifyScreen}");
      }
    } else {
      if (loginResponseModel.value.message! ==
          "User with this phone or country code doen't exist") {
        Get.snackbar("alert".tr, "user_not_exist".tr,
            backgroundColor: Colors.black87, colorText: Colors.white);
      } else {
        Get.snackbar("alert".tr, loginResponseModel.value.message!,
            backgroundColor: Colors.black87, colorText: Colors.white);
      }
    }
  }

  saveCountryCodeAndNumber() async {
    await dataDocument.value
        .write(StorageConstants.CountryCode, countryCode.replaceAll("+", ""));
    await dataDocument.value.write(
        StorageConstants.PhoneNumber,
        "#" +
            phoneNumberController.value.text
                .replaceAll(" ", "")
                .replaceAll("(", "")
                .replaceAll(")", "")
                .replaceAll("-", "")
                .replaceAll("+", ""));
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();

    appSignature.value = await SmsAutoFill().getAppSignature;

    log("appSignature : ${appSignature.value}");
  }
}
