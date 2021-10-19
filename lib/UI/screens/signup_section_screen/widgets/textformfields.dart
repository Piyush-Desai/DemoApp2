import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:demoapp/infrastructure/commons/constants/color_constants.dart';

class SignUpTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final IconButton? icon;
  final bool? isReadOnly;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Color? fillColor;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final Color? hintTextColor;
  final TextAlign? textAlign;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final EdgeInsetsGeometry? contentPadding;
  final ValueChanged<String>? onFieldSubmitted;
  final FontWeight? fontWeight;
  final ValueChanged<String>? onChanged;
  final Iterable<String>? autofillHints;

  const SignUpTextFormField({Key? key,
    this.controller,
    this.textInputType,
    this.icon,
    this.isReadOnly,
    this.textInputAction,
    this.focusNode,
    this.fillColor,
    this.validator,
    this.inputFormatters,
    this.hintText,
    this.hintTextColor,
    this.textAlign,
    this.suffixIcon,
    this.maxLines,
    this.contentPadding,
    this.minLines,
    this.onFieldSubmitted,
    this.fontWeight,
    this.onChanged,
    this.autofillHints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign ?? TextAlign.left,
      inputFormatters: inputFormatters,
      validator: validator,
      focusNode: focusNode,
      maxLines: maxLines ?? 1,
      minLines: minLines ?? 1,
      textInputAction: textInputAction,
      readOnly: isReadOnly ?? false,
      style: TextStyle(fontWeight: fontWeight ?? FontWeight.normal),
      keyboardType: textInputType ?? TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(
            color: hintTextColor, fontSize: 13, fontWeight: FontWeight.normal),
        hintText: hintText,
        border: InputBorder.none,
        contentPadding:
            contentPadding ?? const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        fillColor: fillColor ?? ColorConstants.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: ColorConstants.textFormFieldBorderColor.withOpacity(0.8),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorConstants.primaryColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: ColorConstants.textFormFieldBorderColor.withOpacity(0.8),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorConstants.deleteBackgroundColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onChanged: onChanged,
      autofillHints: autofillHints,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
