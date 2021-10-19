import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:demoapp/UI/commons/button_widgets/buttons.dart';
import 'package:demoapp/UI/commons/text_widgets/base/headline_body_one_base_widget.dart';
import 'package:demoapp/UI/commons/text_widgets/base/headline_five_base_widget.dart';
import 'package:demoapp/UI/screens/SelectUserTypeSection/controllers/select_user_tyoe_controller.dart';
import 'package:demoapp/UI/screens/SelectUserTypeSection/widgets/screen_background_with_out_scroll.dart';
import 'package:demoapp/infrastructure/commons/constants/color_constants.dart';
import 'package:demoapp/infrastructure/commons/constants/image_constants.dart';
import 'package:demoapp/infrastructure/commons/constants/app_routes.dart';

class SelectUserTypeScreen extends GetView<SelectUserTypeController> {
  const SelectUserTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: ScreenBackgroundWithOutScroll(
        imageName: ImageConstants.darkBackgroundImagePng,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        padding: const EdgeInsets.all(0),
        appBar: AppBar(
          leading: Container(),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: Obx(
                () => DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: controller.dropdownValue.value,
                    icon: const Icon(
                      CupertinoIcons.chevron_down,
                      size: 18,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      switch (newValue) {
                        case "عربي":
                          controller.saveLanguageLocale("ar");
                          controller.changeLocale("ar");
                          break;
                        case "English":
                          controller.saveLanguageLocale("en");
                          controller.changeLocale("en");
                          break;
                        default:
                      }

                      controller.dropdownValue.value = newValue!;
                    },
                    items: <String>[
                      "عربي",
                      "English",
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              ImageConstants.fluent_globe,
                              width: 18.0,
                              height: 18.0,
                            ),
                            HeadlineBodyOneBaseWidget(
                              title: "$value ",
                              maxline: 1,
                              fontWeight: FontWeight.w500,
                              textOverflow: TextOverflow.visible,
                              fontSize: 14.0,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              getWelComeWidget(context : context),

              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HeadlineBodyOneBaseWidget(
                      title: "already_have_account".tr,
                      maxline: 1,
                      fontWeight: FontWeight.w400,
                      textOverflow: TextOverflow.visible,
                      fontSize: 16.0,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    InkWell(
                      child: HeadlineBodyOneBaseWidget(
                        title: "log_in".tr,
                        fontWeight: FontWeight.w500,
                        titleColor: const Color(0xFF017EE7),
                        maxline: 1,
                        textOverflow: TextOverflow.visible,
                        fontSize: 16.0,
                      ),
                      onTap: () {
                        Get.rootDelegate.toNamed(
                            "${RoutesConstants.selectUserTypeScreen}${RoutesConstants.loginScreen}");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () {
        SystemNavigator.pop();
        return Future.value(false);
      },
    );
  }

  getWelComeWidget({required BuildContext context}) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ImageConstants.logoPng,
          ),
          const SizedBox(
            height: 24.0,
          ),
          HeadlineFiveBaseWidget(
              title: "welcome_to_lawyer_app".tr,
              fontWeight: FontWeight.w500),
          const SizedBox(
            height: 16.0,
          ),
          HeadlineBodyOneBaseWidget(
            title: "welcome_to_lawyer_app_description".tr,
            maxline: 3,
            fontWeight: FontWeight.normal,
            textOverflow: TextOverflow.visible,
            fontSize: 14.0,
            titleTextAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 36.0,
          ),
          GradientBtn(
            onPressed: () async {
              await controller.saveUserType(userType: "lawyer");

              Get.rootDelegate.toNamed(
                  "${RoutesConstants.selectUserTypeScreen}${RoutesConstants.lawyerSignUpScreen}");
            },
            text: "are_you_lawyer".tr,
            elevation: 0,
            textColor: ColorConstants.white,
            radius: 30,
            padding: 40,
            isTrailingVisible: false,
          ),
          const SizedBox(
            height: 24.0,
          ),
          GradientBtn(
            onPressed: () async {
              await controller.saveUserType(userType: "user");

              Get.rootDelegate.toNamed(
                  "${RoutesConstants.selectUserTypeScreen}${RoutesConstants.userSignUpScreen}");
            },
            text: "are_you_complainant_user".tr,
            elevation: 0,
            textColor: ColorConstants.white,
            radius: 30,
            padding: 40,
            isTrailingVisible: false,
          ),
        ],
      ),
    );
  }
}
