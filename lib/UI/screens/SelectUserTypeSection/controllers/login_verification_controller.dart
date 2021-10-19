import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:demoapp/infrastructure/commons/constants/app_routes.dart';
import 'package:demoapp/infrastructure/commons/constants/storage_constants.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIRepository/login_api_repository.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIRepository/login_otp_api_repository.dart';
import 'package:demoapp/infrastructure/models/responses/login_response_model.dart';
import 'package:demoapp/infrastructure/models/responses/login_verify_response_model.dart';
import 'package:sms_autofill/sms_autofill.dart';

class LoginVerificationController extends GetxController with CodeAutoFill {
  RxBool enableButton = false.obs;
  RxString smsOTP = "".obs;
  RxString appSignature = "".obs;
  Rx<TextEditingController> otpController = TextEditingController().obs;
  RxBool hasError = false.obs;
  Rx<GetStorage> getStorage = GetStorage().obs;
  RxString deviceToken = "".obs;
  RxString deviceId = "".obs;
  RxString countryCode = "".obs;
  RxString phoneNumber = "".obs;
  RxString testOTP = "".obs;
  RxBool checkPhoneNumberIsTest = false.obs;

  RxInt timeOutInSeconds = 60.obs;
  Rx<LoginVerifyResponseModel> loginVerifyResponseModel =
      LoginVerifyResponseModel().obs;
  Rx<LoginVerifyUserDataModel> loginVerifyUserDataModel =
      LoginVerifyUserDataModel().obs;

  final LoginOTPAPIRepository loginOTPAPIRepository;
  final LoginAPIRepository loginAPIRepository;

  var phoneNumberFocusNode = FocusNode().obs;

  LoginVerificationController(
      {required this.loginAPIRepository, required this.loginOTPAPIRepository});

  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    listenForCode();

    SmsAutoFill().getAppSignature.then((signature) {
      appSignature.value = signature;
      log("appSignature : ${appSignature.value}");
    });
    await getDeviceTokenAndDeviceId();
    await getCountryCodeAndPhoneNumberAndOTPIfTest();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cancel();
  }

  callLoginAPI({required String loginRequestJson}) async {
    loginResponseModel =
        (await loginAPIRepository.getLoginAPIResponse(loginRequestJson)).obs;

    if (loginResponseModel.value.success!) {
      bool checkPhoneNumber =
          jsonDecode(loginRequestJson)["phone"].toString().startsWith("#");

      if (checkPhoneNumber) {
        await getStorage.value
            .write(StorageConstants.checkPhoneNumberIsTest, checkPhoneNumber);
        await getStorage.value.write(
            StorageConstants.testOTP, loginResponseModel.value.data!.otp);
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

  callLoginVerificationAPI({required String loginRequestJson}) async {
    loginVerifyResponseModel = (await loginOTPAPIRepository
            .getLoginVerifyAPIResponse(loginRequestJson))
        .obs;

    if (loginVerifyResponseModel.value.success!) {
      log("login response : ${jsonEncode(loginVerifyResponseModel.value.data)}");

      loginVerifyUserDataModel.value = LoginVerifyUserDataModel.fromJson(
          jsonDecode(jsonEncode(loginVerifyResponseModel.value.data)));

      await getStorage.value.write(StorageConstants.userDataModel,
          jsonEncode(loginVerifyResponseModel.value.data!));
      await getStorage.value.write(StorageConstants.isLoggedIn, true);
      await getStorage.value.write(StorageConstants.userIdConstant,
          loginVerifyResponseModel.value.data!.uId);
      await getStorage.value.write(StorageConstants.userRegistrationType, 1);
      await getStorage.value.write(StorageConstants.testOTP, "");
      Get.rootDelegate.offNamed(
        RoutesConstants.bottomNavigationBarScreen,
      );
    } else {
      Get.snackbar("alert".tr, loginVerifyResponseModel.value.message!,
          backgroundColor: Colors.black87, colorText: Colors.white);
    }
  }

  getDeviceTokenAndDeviceId() async {
    deviceToken.value =
        await getStorage.value.read(StorageConstants.DeviceToken);
    deviceId.value = await getStorage.value.read(StorageConstants.DeviceId);
  }

  getCountryCodeAndPhoneNumberAndOTPIfTest() async {
    countryCode.value =
        await getStorage.value.read(StorageConstants.CountryCode);
    phoneNumber.value =
        await getStorage.value.read(StorageConstants.PhoneNumber);
    checkPhoneNumberIsTest.value =
        await getStorage.value.read(StorageConstants.checkPhoneNumberIsTest);

    if (checkPhoneNumberIsTest.value) {
      testOTP.value = await getStorage.value.read(StorageConstants.testOTP);
      smsOTP.value = testOTP.value;
    }
  }

  setOtpCode({required String code}) {
    smsOTP.value = code;
  }

  @override
  void codeUpdated() {
    log("code sent : ${code!}");
    smsOTP.value = code!;
  }
}
