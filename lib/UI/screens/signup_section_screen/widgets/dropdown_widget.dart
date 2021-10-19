import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:demoapp/UI/commons/text_widgets/base/headline_body_one_base_widget.dart';
import 'package:demoapp/infrastructure/commons/constants/color_constants.dart';
import 'package:demoapp/infrastructure/commons/constants/image_constants.dart';

class DropDownWidget extends StatelessWidget {
  final List<String?>? itemList;
  final ValueChanged<String?>? onChangedValue;
  final selectedValue;

  const DropDownWidget(
      {Key? key, this.itemList, this.onChangedValue, this.selectedValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
          color: ColorConstants.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String?>(
          focusColor: ColorConstants.transparentColor,
          style: const TextStyle(
            color: ColorConstants.blackTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          dropdownColor: ColorConstants.white,
          value: selectedValue,
          items: itemList!.map<DropdownMenuItem<String?>>((String? value) {
            return DropdownMenuItem<String?>(
              value: value,
              child: HeadlineBodyOneBaseWidget(
                  title: value!,
                  maxline: 1,
                  fontWeight: FontWeight.normal,
                  textOverflow: TextOverflow.ellipsis,
                  fontSize: 13),
            );
          }).toList(),
          onChanged: onChangedValue!,
          isExpanded: true,
          icon: SvgPicture.asset(
            ImageConstants.arrow_down,
          ),
        ),
      ),
    );
  }
}

class DropDownLanguageWidget extends StatelessWidget {
  final String? hintText;
  final List<String>? itemList;
  final ValueChanged<String?>? onChangedValue;
  final selectedValue;

  const DropDownLanguageWidget(
      {Key? key,
      this.hintText,
      this.itemList,
      this.onChangedValue,
      this.selectedValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
          color: ColorConstants.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          focusColor: ColorConstants.transparentColor,
          style: const TextStyle(
              color: ColorConstants.blackTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 15),
          dropdownColor: ColorConstants.white,
          value: selectedValue,
          items: itemList!.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: HeadlineBodyOneBaseWidget(
                  title: value,
                  maxline: 1,
                  fontWeight: FontWeight.normal,
                  textOverflow: TextOverflow.ellipsis,
                  fontSize: 13),
            );
          }).toList(),
          onChanged: onChangedValue!,
          isExpanded: true,
          icon: SvgPicture.asset(
            ImageConstants.arrow_down,
          ),
        ),
      ),
    );
  }
}

class DisplayCaseModel {
  final String caseName;
  final String caseValue;

  DisplayCaseModel({required this.caseName, required this.caseValue});
}
