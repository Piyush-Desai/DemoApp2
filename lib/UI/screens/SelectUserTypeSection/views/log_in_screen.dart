import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:demoapp/UI/commons/InternationalPhoneInput/utils/phone_number.dart';
import 'package:demoapp/UI/commons/InternationalPhoneInput/utils/selector_config.dart';
import 'package:demoapp/UI/commons/InternationalPhoneInput/widgets/input_widget.dart';
import 'package:demoapp/UI/commons/behaviour/behaviour.dart';
import 'package:demoapp/UI/commons/text_widgets/text_utils.dart';
import 'package:demoapp/UI/commons/text_widgets/base/headline_body_one_base_widget.dart';
import 'package:demoapp/UI/screens/SelectUserTypeSection/controllers/login_controller.dart';
import 'package:demoapp/UI/screens/SelectUserTypeSection/widgets/screen_background_with_out_scroll.dart';
import 'package:demoapp/infrastructure/commons/constants/color_constants.dart';
import 'package:demoapp/infrastructure/commons/constants/font_constant.dart';
import 'package:demoapp/infrastructure/commons/constants/image_constants.dart';
import 'package:demoapp/infrastructure/commons/constants/storage_constants.dart';
import 'package:sms_autofill/sms_autofill.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenBackgroundWithOutScroll(
      child: Obx(() => SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 36.0,
                left: 24.0,
                right: 24.0,
                bottom: 24.0,
              ),
              child: Stack(
                children: [
                  ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                          SizedBox(
                            width: double.infinity,
                            child: Body1Text(
                              text: "mobile_number".tr,
                              maxLine: 1,
                              align: TextAlign.start,
                              textOverflow: TextOverflow.visible,
                              color: Colors.black87,
                              fontFamily: FontConstant.latoRegular,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          phoneNumberTextField(context: context),
                          const SizedBox(
                            height: 24.0,
                          ),
                        ],
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
                              Visibility(
                                visible: controller.validateValue.value,
                                child: Padding(
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
                              ),
                            ],
                          ),
                        ),
                        onTap: () async {
                          if (controller.validateValue.value) {
                            Map body = {
                              "country_code":
                                  controller.countryCode.replaceAll("+", ""),
                              "phone":
                                  "#${controller.phoneNumberController.value.text.replaceAll(" ", "").replaceAll("(", "").replaceAll(")", "").replaceAll("-", "").replaceAll("+", "")}",
                              "is_register": false
                            };
                            await controller.saveCountryCodeAndNumber();

                            SmsAutoFill().listenForCode;
                            await SmsAutoFill().getAppSignature;
                            controller.callLoginAPI(
                                loginRequestJson: jsonEncode(body));
                          } else {
                            Get.snackbar(
                                "alert".tr, "enter_valid_mobile_number".tr,
                                backgroundColor: Colors.black87,
                                colorText: Colors.white);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      padding: const EdgeInsets.all(0),
      appBar: AppBar(
        title: Text(
          "log_in".tr,
          style: const TextStyle(
              color: Colors.black, fontFamily: FontConstant.latoBold),
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

  Widget phoneNumberTextField({required BuildContext context}) {
    return Obx(
      () => Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(0.0),
        decoration: ShapeDecoration(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(10.0),
                topEnd: Radius.circular(10.0),
                bottomStart: Radius.circular(10.0),
                bottomEnd: Radius.circular(10.0)),
          ),
          color: ColorConstants.white,
          shadows: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 3.0,
            ),
          ],
        ),
        child: InternationalPhoneNumberInput(
          onInputChanged: (PhoneNumber number) {
            log("real number : ${number.phoneNumber}");
            controller.countryCode.value =
                number.dialCode!.replaceRange(0, 1, "");
            controller.alphaCode.value = number.isoCode!;

            controller.realPhoneNumber.value = number.phoneNumber!
                .replaceRange(0, number.dialCode!.length, "");
          },
          autofillHints: const [AutofillHints.telephoneNumber],
          onInputValidated: (bool value) {
            controller.validateValue.value = value;
          },
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.DIALOG,
          ),
          searchBoxDecoration: InputDecoration(
              labelText: controller.dataDocument.value
                              .read(StorageConstants.LanguageLocaleCode) !=
                          null &&
                      controller.dataDocument.value
                              .read(StorageConstants.LanguageLocaleCode) ==
                          "en"
                  ? 'Search by country name or dial code'
                  : 'البحث عن طريق اسم الدولة أو رمز الاتصال الهاتفي'),
          ignoreBlank: false,
          hintText: "enter_mobile_number".tr,
          selectorTextStyle: const TextStyle(color: Colors.black),
          initialValue: controller.number.value,
          textFieldController: controller.phoneNumberController.value,
          focusNode: controller.focusPhoneNumber.value,
          inputBorder: const OutlineInputBorder(),
          textStyle:
              const TextStyle(fontSize: 16.0, fontFamily: "FuturaMedium"),
        ),
      ),
    );
  }
}
