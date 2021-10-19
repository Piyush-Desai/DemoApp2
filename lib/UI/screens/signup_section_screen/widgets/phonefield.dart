import 'package:flutter/material.dart';
import 'package:demoapp/UI/commons/InternationalPhoneInput/utils/phone_number.dart';
import 'package:demoapp/UI/commons/InternationalPhoneInput/utils/selector_config.dart';
import 'package:demoapp/UI/commons/InternationalPhoneInput/widgets/input_widget.dart';
import 'package:demoapp/infrastructure/commons/constants/color_constants.dart';


class PhoneField extends StatelessWidget {
  String? countryCode;
  String? alphaCode;
  String? realPhoneNumber;
  final ValueChanged<PhoneNumber>? onInputChange;
  final FormFieldValidator<String>? validation;
  final ValueChanged<bool>? onInputValidation;
  bool? validateValue;
  final PhoneNumber? phoneNumber;
  TextEditingController? phoneNumberController;
  FocusNode? focusPhoneNumber;

  PhoneField(
      {Key? key, countryCode,
      alphaCode,
      realPhoneNumber,
      validateValue,
      phoneNumberController,
      focusPhoneNumber,
      this.onInputChange,
      this.validation,
      this.onInputValidation, this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(0.0),
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(8.0),
              topEnd: Radius.circular(8.0),
              bottomStart: Radius.circular(8.0),
              bottomEnd: Radius.circular(8.0)),
        ),
        color: ColorConstants.white,
      ),
      child: InternationalPhoneNumberInput(
        onInputChanged: onInputChange,
        onInputValidated: onInputValidation,
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.DIALOG,
        ),
        validator: validation,
        ignoreBlank: false,
        hintText: "Enter mobile Number",
        selectorTextStyle: const TextStyle(color: Colors.black),
        initialValue: phoneNumber,
        textFieldController: phoneNumberController,
        focusNode: focusPhoneNumber,
        inputBorder: const OutlineInputBorder(),
        textStyle: const TextStyle(fontSize: 16.0, fontFamily: "FuturaMedium"),
      ),
    );
  }
}

