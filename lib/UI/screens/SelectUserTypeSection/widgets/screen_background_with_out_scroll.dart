import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:demoapp/infrastructure/commons/constants/color_constants.dart';
import 'package:demoapp/infrastructure/commons/constants/image_constants.dart';

class ScreenBackgroundWithOutScroll extends StatefulWidget {

  final Widget child;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final String imageName;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsetsGeometry padding;
  final AppBar appBar;

  const ScreenBackgroundWithOutScroll(
      {Key? key,
        required this.child,
        required this.mainAxisAlignment,
        required this.mainAxisSize,
        required this.crossAxisAlignment,
        required this.padding,

        required this.appBar,
        required this.imageName}) : super(key: key);

  @override
  _ScreenBackgroundWithOutScrollState createState() => _ScreenBackgroundWithOutScrollState();
}

class _ScreenBackgroundWithOutScrollState extends State<ScreenBackgroundWithOutScroll> {
  @override
  Widget build(BuildContext context) {

    if(Platform.isIOS){
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
          statusBarBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.black));
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(widget.imageName.isNotEmpty ? widget.imageName : ImageConstants.backgroundImage),
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
        ),
      ),
      padding:  widget.padding,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        appBar: widget.appBar,
        body: InkWell(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          splashColor: ColorConstants.transparentColor,
          focusColor: ColorConstants.transparentColor,
          hoverColor: ColorConstants.transparentColor,
          highlightColor: ColorConstants.transparentColor,
          child: Theme(
            data: ThemeData(
                primaryColor: ColorConstants.white,
                accentColor: ColorConstants.primaryColor),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
