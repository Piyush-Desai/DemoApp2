import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:demoapp/UI/commons/behaviour/behaviour.dart';
import 'package:demoapp/UI/commons/button_widgets/buttons.dart';
import 'package:demoapp/UI/commons/text_widgets/base/headline_body_one_base_widget.dart';
import 'package:demoapp/UI/commons/text_widgets/base/headline_five_base_widget.dart';
import 'package:demoapp/UI/screens/SelectUserTypeSection/widgets/screen_background_with_out_scroll.dart';
import 'package:demoapp/UI/screens/SelectUserTypeSection/widgets/timer_button.dart';
import 'package:demoapp/UI/screens/signup_section_screen/controllers/otp_verification_screen_controller.dart';
import 'package:demoapp/infrastructure/commons/constants/color_constants.dart';
import 'package:demoapp/infrastructure/commons/constants/font_constant.dart';
import 'package:demoapp/infrastructure/commons/constants/image_constants.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpVerificationScreen extends GetView<OtpVerificationScreenController> {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenBackgroundWithOutScroll(
      appBar: AppBar(
        backgroundColor: ColorConstants.transparentColor,
        elevation: 0,
        centerTitle: true,
        title: HeadlineFiveBaseWidget(
          title: "verification".tr,
          //"createAccount,
          fontWeight: FontWeight.w600,
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SvgPicture.asset(
              ImageConstants.back_icon,
            ),
          ),
        ),
      ),
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      padding: EdgeInsets.zero,
      imageName: ImageConstants.darkBackgroundImagePng,
      child: Obx(
        () => ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 30, right: 30),
              child: Column(
                children: [
                  HeadlineFiveBaseWidget(
                    title: "verifyMobileNumber".tr,
                    //"createAccount,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  HeadlineBodyOneBaseWidget(
                      title: "otpPin".tr,
                      maxline: 2,
                      fontWeight: FontWeight.w500,
                      textOverflow: TextOverflow.ellipsis,
                      titleColor: ColorConstants.greyColor,
                      titleTextAlign: TextAlign.center,
                      fontSize: 16),
                  const SizedBox(
                    height: 50,
                  ),
                  PinFieldAutoFill(
                    decoration: UnderlineDecoration(
                      textStyle:
                          const TextStyle(fontSize: 20, color: Colors.black),
                      colorBuilder:
                          FixedColorBuilder(Colors.black.withOpacity(0.3)),
                    ),
                    currentCode: controller.smsOTP.value,
                    onCodeSubmitted: (code) {
                      controller.smsOTP.value = code;
                    },
                    autoFocus: true,
                    codeLength: 6,
                    onCodeChanged: (code) {
                      if (controller.smsOTP.value.isEmpty &&
                          code!.length == 4) {
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
                  GradientBtn(
                    onPressed: () {
                      controller.onSubmit(
                          controller.userType.value == "lawyer" ? true : false);
                    },
                    text: "signUp".tr,
                    elevation: 0,
                    textColor: ColorConstants.white,
                    radius: 30,
                    padding: 10,
                    isTrailingVisible: true,
                    //onTapSuffix: () => Get.to(BottomNavigationBarScreen()),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
