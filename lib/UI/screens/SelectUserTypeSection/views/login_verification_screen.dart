import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:demoapp/UI/commons/behaviour/behaviour.dart';
import 'package:demoapp/UI/commons/text_widgets/base/headline_body_one_base_widget.dart';
import 'package:demoapp/UI/screens/SelectUserTypeSection/controllers/login_verification_controller.dart';
import 'package:demoapp/UI/screens/SelectUserTypeSection/widgets/screen_background_with_out_scroll.dart';
import 'package:demoapp/UI/screens/SelectUserTypeSection/widgets/timer_button.dart';
import 'package:demoapp/infrastructure/commons/constants/color_constants.dart';
import 'package:demoapp/infrastructure/commons/constants/font_constant.dart';
import 'package:demoapp/infrastructure/commons/constants/image_constants.dart';
import 'package:sms_autofill/sms_autofill.dart';

class LoginVerificationScreen extends GetView<LoginVerificationController> {
  const LoginVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenBackgroundWithOutScroll(
      child: Obx(
        () => SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 36.0,
              left: 24.0,
              bottom: 24.0,
              right: 24.0,
            ),
            child: Stack(
              children: [
                ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0, left: 30, right: 30),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 24.0,
                          ),
                          HeadlineBodyOneBaseWidget(
                            title: "log_in_screen_description".tr,
                            maxline: 3,
                            fontWeight: FontWeight.normal,
                            textOverflow: TextOverflow.visible,
                            fontSize: 18.0,
                            titleTextAlign: TextAlign.center,
                            titleColor: Colors.black87,
                          ),
                          const SizedBox(
                            height: 24.0,
                          ),
                          PinFieldAutoFill(
                            decoration: UnderlineDecoration(
                              textStyle:
                                  const TextStyle(fontSize: 20, color: Colors.black),
                              colorBuilder: FixedColorBuilder(
                                  Colors.black.withOpacity(0.3)),
                            ),
                            currentCode: controller.smsOTP.value,
                            onCodeSubmitted: (code) {
                              controller.smsOTP.value = code;
                            },
                            autoFocus: true,
                            codeLength: 6,
                            onCodeChanged: (code) {
                              if (controller.smsOTP.value.isEmpty && code!.length == 4) {
                                controller.smsOTP.value = code;
                              } else {
                                if (code!.length == 4) {
                                  FocusScope.of(context).requestFocus(FocusNode());
                                }
                              }
                            },
                          ),

                          const SizedBox(
                            height: 30,
                          ),
                          TimerButton(
                            label: "resendCode".tr,
                            timeOutInSeconds: controller.timeOutInSeconds.value,
                            onPressed: () {
                              controller.timeOutInSeconds.value = 60;

                              Map body = {
                                "country_code": "${controller.countryCode}",
                                "phone": "${controller.phoneNumber}",
                                "is_register": false
                              };

                              controller.callLoginAPI(
                                  loginRequestJson: jsonEncode(body));
                              log("message");
                              //resendOtp();
                            },
                            disabledColor: Colors.transparent,
                            buttonType: ButtonType.RaisedButton,
                            color: Colors.transparent,
                            disabledTextStyle: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontSize: 18,
                                    fontFamily: FontConstant.latoRegular),
                            activeTextStyle:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontSize: 18,
                                      fontFamily: FontConstant.latoRegular,
                                      color: ColorConstants.blueColor,
                                    ),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      child: Container(
                        width: double.infinity,
                        height: 60.0,
                        decoration: ShapeDecoration(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                30.0,
                              ),
                            ),
                          ),
                          gradient: LinearGradient(
                            colors: ColorConstants.buttonGradientColor,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: HeadlineBodyOneBaseWidget(
                                title: "continue".tr,
                                maxline: 1,
                                fontWeight: FontWeight.w600,
                                textOverflow: TextOverflow.visible,
                                fontSize: 16.0,
                                titleColor: ColorConstants.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 14.0,
                                right: 14.0,
                              ),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: SvgPicture.asset(
                                    ImageConstants.right_arrow),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        if (controller.smsOTP.value.length == 4) {
                          Map body = {
                            "country_code": "${controller.countryCode}",
                            "phone": "${controller.phoneNumber}",
                            "fcm": "${controller.deviceToken}",
                            "device_id": "${controller.deviceId}",
                            "device_type": Platform.isAndroid ? "A" : "I",
                            "otp": "${controller.smsOTP}"
                          };

                          log("verification body :  ${jsonEncode(body)}");

                          controller.callLoginVerificationAPI(
                              loginRequestJson: jsonEncode(body));
                        } else {
                          Get.snackbar("alert".tr, "Please enter valid otp");
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      padding: const EdgeInsets.all(0),
      appBar: AppBar(
        title: Text(
          "log_in".tr,
          style:
              const TextStyle(color: Colors.black, fontFamily: FontConstant.latoBold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(
              ImageConstants.back_icon,
              height: 14.0,
              width: 14.0,
            ),
          ),
        ),
      ),
      imageName: ImageConstants.darkBackgroundImagePng,
    );
  }
}
