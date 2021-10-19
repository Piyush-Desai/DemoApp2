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
import 'package:demoapp/UI/screens/signup_section_screen/widgets/bottom_sheet_widget.dart';
import 'package:demoapp/UI/screens/signup_section_screen/widgets/dropdown_widget.dart';
import 'package:demoapp/UI/screens/signup_section_screen/widgets/multi_select_chip.dart';
import 'package:demoapp/UI/screens/signup_section_screen/widgets/tandc_text.dart';
import 'package:demoapp/UI/screens/signup_section_screen/widgets/textformfields.dart';
import 'package:demoapp/infrastructure/commons/constants/color_constants.dart';
import 'package:demoapp/infrastructure/commons/constants/image_constants.dart';
import 'package:demoapp/infrastructure/commons/utils/validator.dart';
import 'package:demoapp/UI/screens/signup_section_screen/controllers/lawyer_signup_screen_controller.dart';

class LawyerSignUpScreen extends GetView<LawyerSignUpScreenController> {
  const LawyerSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        child: ScreenBackgroundWithOutScroll(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          padding: EdgeInsets.zero,
          mainAxisAlignment: MainAxisAlignment.start,
          appBar: AppBar(
            backgroundColor: ColorConstants.transparentColor,
            elevation: 0,
            centerTitle: true,
            leading: InkWell(
              onTap: () async {
                await controller.clearAll();
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SvgPicture.asset(
                  ImageConstants.back_icon,
                ),
              ),
            ),
            title: HeadlineFiveBaseWidget(
              title: "createAccount".tr,
              fontWeight: FontWeight.w600,
            ),
            actions: const [],
          ),
          imageName: ImageConstants.darkBackgroundImagePng,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: controller.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
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
                          fontWeight: FontWeight.w500,
                          textOverflow: TextOverflow.ellipsis,
                          fontSize: 14),
                      const SizedBox(
                        height: 10,
                      ),
                      phoneNumberTextField(context),
                      Visibility(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: HeadlineBodyOneBaseWidget(
                            title: "inValidPhoneNumberText".tr,
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
                        height: 30,
                      ),
                      getInterestFieldWidget(context: context),
                      const SizedBox(
                        height: 30,
                      ),
                      getProfessionalDetailsWidget(context: context),
                      const SizedBox(
                        height: 30,
                      ),
                      getLicenceNumberWidget(context: context),
                      const SizedBox(
                        height: 30,
                      ),
                      getPreferredLanguage(context: context),
                      const SizedBox(
                        height: 30,
                      ),
                      getDisplayCasesWidget(context: context),
                      const SizedBox(
                        height: 30,
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
                          Expanded(
                            child: tAndcText(),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
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
                ),
              ),
            ),
          ),
        ),
        onWillPop: () async {
          Get.back();
          return true;
        },
      ),
    );
  }

  Widget phoneNumberTextField(BuildContext context) {
    return Container(
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
        autofillHints: const [AutofillHints.telephoneNumber],
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
          inputFormatters: [
            FilteringTextInputFormatter.deny(
              RegExp(
                  r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
            )
          ],
          validator: (val) {
            return Validator.validateFirstName(val!, "emptyFirstNameText".tr,
                "invalidFirstNameText".tr, context);
          },
          onChanged: (value) {},
          hintText: "firstName".tr,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.name,
          autofillHints: const [AutofillHints.name],
        ),
      ],
    );
  }

  Widget getLastNameWidget({required BuildContext context}) {
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
          inputFormatters: [
            FilteringTextInputFormatter.deny(
              RegExp(
                  r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
            )
          ],
          validator: (val) {
            return Validator.validateLastName(val!, "emptyLastNameText".tr,
                "invalidLastNameText".tr, context);
          },
          hintText: "lastName".tr,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.name,
          autofillHints: const [AutofillHints.familyName],
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
          hintText: "email".tr,
          validator: (val) {
            return Validator.validateEmail(val!);
          },
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9_.@-]")),
          ],
          autofillHints: const [AutofillHints.email],
        ),
      ],
    );
  }

  Widget getInterestFieldWidget({required BuildContext context}) {
    return Column(
      children: [
        HeadlineBodyOneBaseWidget(
          title: "interestField".tr,
          maxline: 1,
          fontWeight: FontWeight.w500,
          textOverflow: TextOverflow.ellipsis,
          fontSize: 14,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: ColorConstants.white,
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: InkWell(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              showModalBottomSheet(
                context: context,
                builder: (builder) => MultiSelectBottomSheet(
                  controller: controller,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                ),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Wrap(
                    spacing: 4.0,
                    runSpacing: 0.0,
                    children: List<Widget>.generate(
                        // controller.confirmSelectedInterestFieldValue.length,
                        controller.interestFieldList.length, (int i) {
                      return Chip(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        label: Text(
                          controller.getInterestFieldName(
                              interestFieldList: controller.interestFieldList
                                  .elementAt(i)
                                  .obs),
                          style: const TextStyle(fontSize: 12),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                        deleteIcon: SvgPicture.asset(
                          ImageConstants.cross_icon,
                          height: 12,
                          width: 12,
                        ),
                        onDeleted: () {
                          controller.removeItem(i);
                        },
                      );
                    }).toList(),
                  ),
                ),
                SvgPicture.asset(ImageConstants.arrow_down)
              ],
            ),
          ),
        ),
        Visibility(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: HeadlineBodyOneBaseWidget(
              title: "interestFieldIsRequiredText".tr,
              maxline: 1,
              fontWeight: FontWeight.w400,
              textOverflow: TextOverflow.ellipsis,
              fontSize: 12,
              titleColor: ColorConstants.deleteBackgroundColor,
            ),
          ),
          visible: controller.isLengthZero.value,
        ),
      ],
    );
  }

  Widget getProfessionalDetailsWidget({required BuildContext context}) {
    return Column(
      children: [
        HeadlineBodyOneBaseWidget(
          title: "professionalDetails".tr,
          maxline: 1,
          fontWeight: FontWeight.w500,
          textOverflow: TextOverflow.ellipsis,
          fontSize: 14,
        ),
        const SizedBox(
          height: 10,
        ),
        SignUpTextFormField(
          controller: controller.professionalDetailsController,
          focusNode: controller.professionalDetailsFocusNode,
          validator: (val) {
            return Validator.validateProfessionalDetails(
              val!,
            );
          },
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          maxLines: 5,
          minLines: 5,
          textInputType: TextInputType.multiline,
          hintText: "writeHere".tr,
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }

  Widget getLicenceNumberWidget({required BuildContext context}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeadlineBodyOneBaseWidget(
                title: "licenceNumber".tr,
                maxline: 1,
                fontWeight: FontWeight.w500,
                textOverflow: TextOverflow.ellipsis,
                fontSize: 14),
            InkWell(
              onTap: () {
                if (controller.isImagesLengthZero.value) {
                  FocusScope.of(context).requestFocus(FocusNode());
                  showModalBottomSheet(
                      context: context,
                      builder: (builder) => ImagePickerBottomSheetWidget(
                            controller: controller,
                            isImageForProfilePic: false,
                          ));
                } else {
                  Get.snackbar("alert".tr, "only_one_image".tr);
                }
              },
              child: Row(
                children: [
                  Image.asset(
                    ImageConstants.add_icon,
                    height: 22,
                    width: 22,
                  ),
                  const SizedBox(width: 5),
                  HeadlineBodyOneBaseWidget(
                      title: "addPhoto".tr,
                      maxline: 1,
                      fontWeight: FontWeight.w500,
                      textOverflow: TextOverflow.ellipsis,
                      fontSize: 14),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorConstants.white),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: TextFormField(
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                  controller: controller.licenceNumberController,
                  focusNode: controller.licenceNumberFocusNode,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp("[a-zA-Zа-яА-Я0-9]"))
                  ],
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      hintStyle: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.normal),
                      hintText: "licenceNumber".tr),
                  onChanged: (value) {
                    if (controller
                        .licenceNumberController.value.text.isNotEmpty) {
                      controller.licenceValidationBool.value = false;
                    } else {
                      controller.licenceValidationBool.value = true;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Image.file(
                              controller.allImages[i],
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 3,
                            right: 3,
                            child: InkWell(
                              onTap: () {
                                controller.allImages.removeAt(i);
                                controller.removeImage();
                              },
                              child: CircleAvatar(
                                backgroundColor: ColorConstants.white,
                                radius: 7,
                                child: SvgPicture.asset(
                                  ImageConstants.cross_icon,
                                  color: ColorConstants.blackTextColor,
                                  height: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: controller.allImages.length,
                ),
              ),
            ],
          ),
        ),
        Visibility(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: HeadlineBodyOneBaseWidget(
              title: "licenceNumberIsRequiredText".tr,
              maxline: 1,
              fontWeight: FontWeight.w400,
              textOverflow: TextOverflow.ellipsis,
              fontSize: 12,
              titleColor: ColorConstants.deleteBackgroundColor,
            ),
          ),
          visible: controller.licenceValidationBool.value,
        ),
        Visibility(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: HeadlineBodyOneBaseWidget(
              title: "licencePhotosRequired".tr,
              maxline: 1,
              fontWeight: FontWeight.w400,
              textOverflow: TextOverflow.ellipsis,
              fontSize: 12,
              titleColor: ColorConstants.deleteBackgroundColor,
            ),
          ),
          visible: controller.isImagesLengthZero.value &&
              !controller.licenceValidationBool.value &&
              controller.isSubmit.value,
        ),
      ],
    );
  }

  Widget getPreferredLanguage({required BuildContext context}) {
    return Column(
      children: [
        HeadlineBodyOneBaseWidget(
            title: "preferredLanguage".tr,
            maxline: 1,
            fontWeight: FontWeight.w500,
            textOverflow: TextOverflow.ellipsis,
            fontSize: 14),
        const SizedBox(
          height: 10,
        ),
        DropDownLanguageWidget(
          hintText: "English",
          itemList: const ["English", "Arabic", "All"],
          onChangedValue: (val) {
            controller.changePreferredLanguage(val);
          },
          selectedValue: controller.selectedPreferredLanguage.value,
        ),
        Visibility(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: HeadlineBodyOneBaseWidget(
              title: "preferredLanguageIsRequiredText".tr,
              maxline: 1,
              fontWeight: FontWeight.w400,
              textOverflow: TextOverflow.ellipsis,
              fontSize: 12,
              titleColor: ColorConstants.deleteBackgroundColor,
            ),
          ),
          visible: controller.isPreferredLanguageSelected.value,
        ),
      ],
    );
  }

  Widget getDisplayCasesWidget({required BuildContext context}) {
    return Column(
      children: [
        HeadlineBodyOneBaseWidget(
          title: "wouldLikeToDisplayCases".tr,
          maxline: 1,
          fontWeight: FontWeight.w500,
          textOverflow: TextOverflow.ellipsis,
          fontSize: 14,
        ),
        const SizedBox(
          height: 10,
        ),
        DropDownWidget(
          itemList: const [
            "As soon as published",
            "After 1 day",
            "After 2 day",
            "After 3 day",
            "After 4 day",
          ],
          onChangedValue: (val) {
            controller.changeDisplayCases(val!);
          },
          selectedValue: controller.selectedDisplayCases.value,
        ),
        const SizedBox(
          height: 20,
        ),
        Visibility(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: HeadlineBodyOneBaseWidget(
              title: "wouldLikeToDisplayCases".tr,
              maxline: 1,
              fontWeight: FontWeight.w400,
              textOverflow: TextOverflow.ellipsis,
              fontSize: 12,
              titleColor: ColorConstants.deleteBackgroundColor,
            ),
          ),
          visible: controller.isPreferredLanguageSelected.value,
        ),
      ],
    );
  }
}
