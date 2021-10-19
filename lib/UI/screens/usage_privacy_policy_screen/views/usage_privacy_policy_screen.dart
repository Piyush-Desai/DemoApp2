import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:demoapp/UI/commons/text_widgets/base/headline_body_one_base_widget.dart';
import 'package:demoapp/UI/commons/text_widgets/base/headline_five_base_widget.dart';
import 'package:demoapp/UI/screens/SelectUserTypeSection/widgets/screen_background_with_out_scroll.dart';
import 'package:demoapp/infrastructure/commons/constants/color_constants.dart';
import 'package:demoapp/infrastructure/commons/constants/image_constants.dart';

class UsagePrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBackgroundWithOutScroll(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      padding: EdgeInsets.zero,
      imageName: ImageConstants.darkBackgroundImagePng,
      appBar: AppBar(
        backgroundColor: ColorConstants.transparentColor,
        elevation: 0,
        centerTitle: true,
        title: HeadlineFiveBaseWidget(
          title: "privacyPolicy".tr,
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadlineBodyOneBaseWidget(
                  title: "privacyPolicyText".tr,
                  maxline: 5,
                  fontWeight: FontWeight.normal,
                  titleColor: ColorConstants.blackTextColor,
                  textOverflow: TextOverflow.ellipsis,
                  fontSize: 17),
              const SizedBox(
                height: 15,
              ),
              HeadlineBodyOneBaseWidget(
                  title:
                      "A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea.",
                  maxline: 10,
                  fontWeight: FontWeight.normal,
                  titleColor: ColorConstants.greyColor,
                  textOverflow: TextOverflow.ellipsis,
                  fontSize: 14),
              const SizedBox(
                height: 20,
              ),
              const HeadlineBodyOneBaseWidget(
                  title: "What does this privacy policy cover ?",
                  maxline: 5,
                  fontWeight: FontWeight.normal,
                  titleColor: ColorConstants.blackTextColor,
                  textOverflow: TextOverflow.ellipsis,
                  fontSize: 17),
              const SizedBox(
                height: 15,
              ),
              HeadlineBodyOneBaseWidget(
                  title:
                      "A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea.",
                  maxline: 10,
                  fontWeight: FontWeight.normal,
                  titleColor: ColorConstants.greyColor,
                  textOverflow: TextOverflow.ellipsis,
                  fontSize: 14),
            ],
          ),
        ),
      ),
    );
  }
}
