import 'package:flutter/material.dart';

class HeadlineSubTitleTextWidget extends StatelessWidget {
  const HeadlineSubTitleTextWidget(
      {required Key key,
        required this.title,
        this.titleColor = Colors.black,
        this.titleTextAlign = TextAlign.center,
        this.fontWeight = FontWeight.w400,
        required this.textDecoration,required this.fontSize})
      : super(key: key);
  final String title;
  final Color titleColor;
  final TextAlign titleTextAlign;
  final TextDecoration textDecoration;
  final FontWeight fontWeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: titleTextAlign,
        style: TextStyle(
            color: titleColor,
            decoration: textDecoration,
            fontSize: fontSize,
            fontWeight: fontWeight));
  }
}
