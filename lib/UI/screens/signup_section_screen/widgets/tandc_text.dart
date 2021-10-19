import 'package:flutter/cupertino.dart';
import 'package:demoapp/infrastructure/commons/constants/color_constants.dart';
import 'package:get/get.dart';
Padding tAndcText() {
  return Padding(
    padding:  const EdgeInsets.only(top: 10.0),
    child: RichText(
        text: TextSpan(children: [
      TextSpan(
          text:"agree".tr,
          style: TextStyle(color: ColorConstants.greyColor,fontSize: 14),
      ),TextSpan(
          text: "tandC".tr,
          style: const TextStyle(color: ColorConstants.blackTextColor,fontSize: 14),
      ),TextSpan(
          text: "registration".tr,
          style: TextStyle(color: ColorConstants.greyColor,fontSize: 14),
      ),TextSpan(
          text: "privacyPolicy".tr,
          style: const TextStyle(color: ColorConstants.blackTextColor,fontSize: 14),
      ),
    ])),
  );
}
