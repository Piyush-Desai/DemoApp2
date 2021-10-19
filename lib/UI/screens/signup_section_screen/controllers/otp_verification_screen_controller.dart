import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:demoapp/UI/screens/signup_section_screen/registration_data_store.dart';
import 'package:demoapp/infrastructure/commons/constants/app_routes.dart';
import 'package:demoapp/infrastructure/commons/constants/storage_constants.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIRepository/lawyer_signup_repository.dart';
import 'package:demoapp/infrastructure/data_access_layer/networks/APIRepository/user_signup_repository.dart';
import 'package:demoapp/infrastructure/models/requests/registration_request_model.dart';
import 'package:demoapp/infrastructure/models/requests/user_registration_request_model.dart';
import 'package:demoapp/infrastructure/models/responses/registration_response_model.dart';
import 'package:demoapp/infrastructure/models/responses/user_registration_response_model.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpVerificationScreenController extends GetxController with CodeAutoFill {
  var otpController = TextEditingController().obs;
  RxString appSignature = "".obs;
  RxString testOTP = "".obs;
  RxBool checkPhoneNumberIsTest = false.obs;
  var hasError = false.obs;

  var smsOTP = "".obs;

  var timeOutInSeconds = 60.obs;

  var userType = "".obs;
  Rx<GetStorage> getStorage = GetStorage().obs;
  var phoneNUmberFocusNode = FocusNode().obs;

  Rx<FirebaseAuth> auth = FirebaseAuth.instance.obs;

  RxString verificationId  = "".obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit

    listenForCode();

    SmsAutoFill().getAppSignature.then((signature) {
      appSignature.value = signature;
      log("appSignature : ${appSignature.value}");
    });

    phoneNUmberFocusNode.value.requestFocus();
    await getUserType();
    await getDeviceTokenAndDeviceId();

    super.onInit();
  }

  sendOTP() async {
    final PhoneCodeSent smsOTPSent = ( verId,  forceCodeResend) {
      verificationId.value = verId;
    };

    try {
      await auth.value.verifyPhoneNumber(
          phoneNumber:
          "+${getStorage.value.read("lawyer_data")["country_code"]}${getStorage.value.read("lawyer_data")["phone"]}",
          // PHONE NUMBER TO SEND OTP
          codeAutoRetrievalTimeout: (String verId) {
            //Starts the phone number verification process for the given phone number.
            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
            verificationId.value = verId;
          },
          codeSent: smsOTPSent,
          // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          timeout: const Duration(seconds: 30),
          verificationCompleted: (AuthCredential phoneAuthCredential) {
            log(phoneAuthCredential.toString());
          },
          verificationFailed: (FirebaseAuthException exception) {
            log('${exception.message}');
          });
    } catch (e) {
      Get.snackbar("alert".tr, e.toString());
    }
  }

  String otp = "";
  Rx<RegistrationResponseModel> registrationResponseModel =
      RegistrationResponseModel().obs;
  Rx<UserRegistrationResponseModel> userRegistrationResponseModel =
      UserRegistrationResponseModel().obs;
  final LawyerSignupRepository lawyerSignupRepository;
  UserSignUpRepository userSignupRepository;
  RxString deviceToken = "".obs;
  RxString deviceId = "".obs;

  setOtp(String pin) {
    otp = pin;
    update();
  }

  getDeviceTokenAndDeviceId() async {
    deviceToken.value =
        await getStorage.value.read(StorageConstants.DeviceToken);
    deviceId.value = await getStorage.value.read(StorageConstants.DeviceId);
    checkPhoneNumberIsTest.value =
        await getStorage.value.read(StorageConstants.checkPhoneNumberIsTest);

    if (checkPhoneNumberIsTest.value) {
      testOTP.value = await getStorage.value.read(StorageConstants.testOTP);
      smsOTP.value = testOTP.value;
    }
  }

  getUserType() async {
    userType.value = await getStorage.value.read(StorageConstants.UserTypeKey);
  }

  OtpVerificationScreenController(
      {required this.lawyerSignupRepository,
      required this.userSignupRepository});

  void onSubmit(
    bool isLawyer,
  ) {
    log("isLawyer : $isLawyer");
    isLawyer ? lawyerRegistrationApiCall() : userRegistrationApiCall();
  }

  Future<String> deviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        return androidInfo.id;
      } else {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        return iosInfo.identifierForVendor;
      }
    } catch (e) {
      return "";
    }
  }

  void lawyerRegistrationApiCall() async {
    RegistrationDataStoreModel data = getStorage.value.read("lawyer_data");
    RegistrationRequestModel registrationRequestModel =
        RegistrationRequestModel(
            firstName: data.firstName,
            lastName: data.lastName,
            email: data.email,
            phone: data.phone!.replaceAll(" ", ""),
            lawyerField: data.lawyerField,
            countryCode: data.countryCode,
            language: "en",
            lang: "en",
            licenseImage: data.licenseImage,
            type: "1",
            licenseNumber: data.licenseNumber,
            fcm: deviceToken.value,
            otp: smsOTP.value,
            deviceType: Platform.isAndroid ? "A" : "I",
            deviceID: deviceId.value,
            userClass: data.userClass);
    log("lawyer request model : ${jsonEncode(registrationRequestModel)}");
    registrationResponseModel.value = (await lawyerSignupRepository
        .getRegistrationResponse(jsonEncode(registrationRequestModel)));

    if (registrationResponseModel.value.success!) {
      log("registration response data : ${jsonEncode(registrationResponseModel.value.data)}");
      Get.snackbar(
        "Alert!",
        "registered success",
      );
      await getStorage.value.write(StorageConstants.isLoggedIn, true);
      await getStorage.value.write(StorageConstants.userIdConstant,
          registrationResponseModel.value.data!.uId);
      await getStorage.value.write(StorageConstants.userDataModel,
          jsonEncode(registrationResponseModel.value.data!));
      await getStorage.value.write(StorageConstants.userRegistrationType, 2);
      Get.rootDelegate.offNamed(RoutesConstants.bottomNavigationBarScreen);
    } else {
      log("registration response error : ${jsonEncode(registrationResponseModel.value.message)}");
      Get.snackbar(
        "Alert!",
        "${registrationResponseModel.value.message}",
      );
    }
  }

  userRegistrationApiCall() async {
    RegistrationDataStoreModel data = getStorage.value.read("user_data");
    UserRegistrationRequestModel registrationRequestModel =
        UserRegistrationRequestModel(
            firstName: data.firstName,
            lastName: data.lastName,
            email: data.email,
            phone: data.phone!.replaceAll(" ", ""),
            countryCode: data.countryCode,
            language: "en",
            lang: "en",
            type: "0",
            fcm: deviceToken.value,
            otp: smsOTP.value,
            deviceType: Platform.isAndroid ? "A" : "I",
            deviceId: deviceId.value);
    userRegistrationResponseModel.value = (await userSignupRepository
        .getRegistrationResponse(jsonEncode(registrationRequestModel)));

    if (userRegistrationResponseModel.value.success!) {
      Get.snackbar("Alert!", "registered success");

      await getStorage.value.write(StorageConstants.isLoggedIn, true);
      await getStorage.value.write(StorageConstants.userIdConstant,
          userRegistrationResponseModel.value.data!.uId);
      await getStorage.value.write(StorageConstants.userDataModel,
          jsonEncode(userRegistrationResponseModel.value.data!));
      await getStorage.value.write(StorageConstants.userRegistrationType, 3);
      Get.rootDelegate.offNamed(
        RoutesConstants.bottomNavigationBarScreen,
      );
    } else {
      log("registration response error : ${jsonEncode(registrationResponseModel.value.message)}");
      Get.snackbar("Alert!", "${userRegistrationResponseModel.value.message}");
    }
  }

  @override
  void codeUpdated() {
    log("code sent : ${code!}");
    smsOTP.value = code!;
  }
}
