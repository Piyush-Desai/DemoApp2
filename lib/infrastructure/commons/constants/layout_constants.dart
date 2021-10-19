import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutConstants {
  //drawer menu

  //container
  static const EdgeInsets containerStandardPadding =
      EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0);


  static Decoration decoration({required Color color}) {
    return ShapeDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(5.0),
            topEnd: Radius.circular(5.0),
            bottomStart: Radius.circular(5.0),
            bottomEnd: Radius.circular(5.0)),
      ),
      color: color,
      shadows: [
        new BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 3.0,
        ),
      ],
    );
  }



}
