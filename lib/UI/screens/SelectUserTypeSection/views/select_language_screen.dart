import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:demoapp/UI/commons/text_widgets/base/headline_body_one_base_widget.dart';
import 'package:demoapp/UI/screens/SelectUserTypeSection/controllers/select_language_controller.dart';
import 'package:demoapp/UI/screens/SelectUserTypeSection/widgets/screen_background_with_out_scroll.dart';
import 'package:demoapp/infrastructure/commons/constants/color_constants.dart';
import 'package:demoapp/infrastructure/commons/constants/font_constant.dart';
import 'package:demoapp/infrastructure/commons/constants/image_constants.dart';
import 'package:demoapp/infrastructure/commons/constants/app_routes.dart';

class SelectLanguageScreen extends GetView<SelectLanguageController> {
  const SelectLanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenBackgroundWithOutScroll(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 15.0,
            left: 8.0,
            right: 8.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(
                  8.0,
                ),
                child: InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.40,
                    height: MediaQuery.of(context).size.width * 0.40,
                    decoration: ShapeDecoration(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10.0,
                          ),
                        ),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5.0,
                        ),
                      ],
                      color: ColorConstants.white,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            ImageConstants.fluent_globe,
                            width: 48.0,
                            height: 48.0,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const HeadlineBodyOneBaseWidget(
                            title: "عربى",
                            maxline: 1,
                            fontWeight: FontWeight.w500,
                            textOverflow: TextOverflow.visible,
                            fontSize: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () async {
                    await controller.setLanguageLocale(languageLocale: "ar");
                    await controller.setFirstVisiBool(firstVisit: true);
                    Get.rootDelegate.toNamed(RoutesConstants.selectUserTypeScreen);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                  8.0,
                ),
                child: InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.40,
                    height: MediaQuery.of(context).size.width * 0.40,
                    decoration: ShapeDecoration(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10.0,
                          ),
                        ),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5.0,
                        ),
                      ],
                      color: ColorConstants.white,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            ImageConstants.fluent_globe,
                            width: 48.0,
                            height: 48.0,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const HeadlineBodyOneBaseWidget(
                            title: "English",
                            maxline: 1,
                            fontWeight: FontWeight.w500,
                            textOverflow: TextOverflow.visible,
                            fontSize: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () async {
                    await controller.setLanguageLocale(languageLocale: "en");
                    await controller.setFirstVisiBool(firstVisit: true);
                    Get.rootDelegate.toNamed(RoutesConstants.selectUserTypeScreen);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      padding: const EdgeInsets.all(0),
      appBar: AppBar(
        title: const Text(
          "Select Language",
          style:
          TextStyle(color: Colors.black, fontFamily: FontConstant.latoBold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      imageName: ImageConstants.darkBackgroundImagePng,
    );
  }
}