import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demoapp/infrastructure/commons/constants/regex_constants.dart';

class Validator {
  static String? validateLastName(String value, String emptyErrorMsg, String validateError,BuildContext context) {
    Pattern pattern = r"^[a-zA-Zа-яА-Я0-9_(-) ]+$";
    RegExp regex = new RegExp(pattern.toString());
    if(value.trim().isEmpty) {
      return emptyErrorMsg;
    } /*else if (!regex.hasMatch(value)) {
      return validateError;
    }*/
    else {
      return null;
    }
  }
  static String? validateFirstName(String value, String emptyErrorMsg, String validateError,BuildContext context) {
    Pattern pattern = r"^[a-zA-Zа-яА-Я_(-) ]+$";
    RegExp regex = new RegExp(pattern.toString());
    if(value.trim().isEmpty) {
      return emptyErrorMsg;
    } else if (!regex.hasMatch(value)) {
      return validateError;
    }
    else {
      return null;
    }
  }
 /* static String? validateEmail(String value){
    RegExp regex = new RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if(value.isEmpty){
      return "AppConstants.pleaseEnterEmailError";
    }else if(!regex.hasMatch(value)){
      return "AppConstants.pleaseEnterValidEmailError";
    }else{
      return null;
    }
  }*/
  static String? validateEmail(String value){
    if(value.isEmpty){
      return "emptyEmailText".tr;
    }else if(!RegExp(RegxConstants.emailRegex).hasMatch(value)){
      return "invalidEmailText".tr;
    }else{
      return null;
    }
  }
  static String? validateProfessionalDetails(String value){
    if(value.trim().isEmpty){
      return "emptyDetailsText".tr;
    }else{
      return null;
    }
  }

  static String? validatePassword(String value){
    RegExp regex = new RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,20}$");
    if(value.isEmpty){
      return "AppConstants.pleaseEnterPasswordError";
    }else if(!regex.hasMatch(value)){
      return "AppConstants.pleaseEnterValidPasswordError";
    }else{
      return null;
    }
  }

  static String? validateFieldNotEmpty(String value, String error){
    if(value.isEmpty){
      return error;
    } else{
      return null;
    }
  }

  static String? phoneNumberValidation(BuildContext context,String value,bool isValid,){
    if(value == null){
      return"emptyPhoneNumberText".tr;
    }else if(value.trim().isEmpty){
      return "emptyPhoneNumberText".tr;
    }else if(!isValid){
      return "inValidPhoneNumberText".tr;
    }
    return null;
  }
}