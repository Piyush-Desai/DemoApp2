import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:demoapp/UI/commons/InternationalPhoneInput/utils/phone_number.dart';
import 'package:demoapp/UI/commons/InternationalPhoneInput/utils/selector_config.dart';
import 'package:demoapp/UI/commons/InternationalPhoneInput/widgets/input_widget.dart';
import 'package:demoapp/UI/commons/behaviour/behaviour.dart';
import 'package:demoapp/UI/commons/button_widgets/buttons.dart';
import 'package:demoapp/UI/commons/text_widgets/base/headline_body_one_base_widget.dart';
import 'package:demoapp/UI/commons/text_widgets/base/headline_five_base_widget.dart';
import 'package:demoapp/UI/screens/SelectUserTypeSection/widgets/screen_background_with_out_scroll.dart';
import 'package:demoapp/UI/screens/signup_section_screen/widgets/tandc_text.dart';
import 'package:demoapp/UI/screens/signup_section_screen/widgets/textformfields.dart';
import 'package:demoapp/infrastructure/commons/constants/color_constants.dart';
import 'package:demoapp/infrastructure/commons/constants/image_constants.dart';
import 'package:demoapp/infrastructure/commons/utils/validator.dart';
import 'package:demoapp/UI/screens/signup_section_screen/controllers/user_signup_screen_controller.dart';

class UserSignUpScreen extends GetView<UserSignUpScreenController> {
  const UserSignUpScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ScreenBackgroundWithOutScroll(
      appBar: AppBar(
          backgroundColor: ColorConstants.signUpBackgroundColor,
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              controller.clearAll();
              Get.back();
            },
            child: Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 16.0),
              child: SvgPicture.asset(
                ImageConstants.back_icon,
              ),
            ),
          ),
          title: HeadlineFiveBaseWidget(
            title: "createAccount".tr,
            fontWeight: FontWeight.w600,
          )),
      padding:  EdgeInsets.zero,
      imageName: ImageConstants.darkBackgroundImagePng,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      child: Obx(
            () =>
        (Padding(
          padding: const  EdgeInsets.all(20.0),
          child: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ScrollConfiguration(
              behavior: MyBehavior(), child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  getFirstNameWidget(context: context),

                  const SizedBox(
                    height: 30,
                  ),

                  getLastNameWidget(context: context),

                  const SizedBox(
                    height: 30,
                  ),

                  getEmailWidget(context: context),

                  const SizedBox(
                    height: 30,
                  ),


                  HeadlineBodyOneBaseWidget(
                      title: "mobile_number".tr,
                      maxline: 1,
                      fontWeight: FontWeight.normal,
                      textOverflow: TextOverflow.ellipsis,
                      fontSize: 14),
                  const SizedBox(
                    height: 10,
                  ),
                  phoneNumberTextField(context),
                  Visibility(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: HeadlineBodyOneBaseWidget(
                        title: "inValidPhoneNumberText".tr,
                        //"p,
                        maxline: 1,
                        fontWeight: FontWeight.w400,
                        textOverflow: TextOverflow.ellipsis,
                        fontSize: 12,
                        titleColor: ColorConstants.deleteBackgroundColor,
                      ),
                    ),
                    visible: controller.phoneErrorVisible.value,
                  ),

                  const SizedBox(
                    height: 20,
                  ),


                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            controller.changeIsActive();
                          },
                          child: Image.asset(controller.isActive.value
                              ? ImageConstants.check_box_tick
                              : ImageConstants.check_box_inactive)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(child: tAndcText())
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GradientBtn(
                    onPressed: controller.onSubmit,
                    text: "signUp".tr,
                    elevation: 0,
                    textColor: ColorConstants.white,
                    radius: 30,
                    padding: 15,
                    isTrailingVisible: false,
                  )
                ],
              ),
            ),),
          ),
        )),
      ),
    );
  }

  Widget phoneNumberTextField(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      margin: const  EdgeInsets.all(0.0),
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

          controller.realPhoneNumber.value =
              number.phoneNumber!.replaceRange(0, number.dialCode!.length, "");
        },
        onInputValidated: (bool value) {
          controller.validateValue.value = value;
        },
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.DIALOG,
        ),
        ignoreBlank: false,
        hintText: "enter_mobile_number".tr,
        selectorTextStyle: const TextStyle(color: Colors.black),
        initialValue: controller.number.value,
        textFieldController: controller.phoneNumberController.value,
        focusNode: controller.focusPhoneNumber.value,
        inputBorder: const OutlineInputBorder(),
        textStyle: const TextStyle(fontSize: 16.0, fontFamily: "FuturaMedium"),
      ),
    );
  }

  Widget getFirstNameWidget({required BuildContext context}) {
    return Column(
      children: [
        HeadlineBodyOneBaseWidget(
            title: "firstName".tr,
            maxline: 1,
            fontWeight: FontWeight.w500,
            textOverflow: TextOverflow.ellipsis,
            fontSize: 14),
        const SizedBox(
          height: 10,
        ),
        SignUpTextFormField(
          controller: controller.firstNameController,
          focusNode: controller.firstNameFocusNode,
          textInputType: TextInputType.name,
          validator: (val) {
            return Validator.validateFirstName(
                val!,
                "emptyFirstNameText".tr,
                "invalidFirstNameText".tr,
                context);
          },
          hintText: "firstName".tr,
          textInputAction: TextInputAction.next,
        ),
      ],
    );
  }

  getLastNameWidget({required BuildContext context}) {
    return Column(
      children: [
        HeadlineBodyOneBaseWidget(
            title: "lastName".tr,
            maxline: 1,
            fontWeight: FontWeight.w500,
            textOverflow: TextOverflow.ellipsis,
            fontSize: 14),
        const SizedBox(
          height: 10,
        ),
        SignUpTextFormField(
          controller: controller.lastNameController,
          focusNode: controller.lastNameFocusNode,
          textInputType: TextInputType.name,
          validator: (val) {
            return Validator.validateLastName(
                val!,
                "emptyLastNameText".tr,
                "invalidLastNameText".tr,
                context);
          },
          hintText: "lastName".tr,
          textInputAction: TextInputAction.next,
        ),
      ],
    );
  }

  Widget getEmailWidget({required BuildContext context}) {
    return Column(

      children: [
        HeadlineBodyOneBaseWidget(
            title: "email".tr,
            maxline: 1,
            fontWeight: FontWeight.w500,
            textOverflow: TextOverflow.ellipsis,
            fontSize: 14),
        const SizedBox(
          height: 10,
        ),
        SignUpTextFormField(
          controller: controller.emailController,
          focusNode: controller.emailFocusNode,
          textInputType: TextInputType.emailAddress,
          hintText: "email".tr,
          validator: (val) {
            return Validator.validateEmail(val!);
          },
          textInputAction: TextInputAction.next,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9_.@-]")),
          ],
        ),
      ],
    );
  }
}
