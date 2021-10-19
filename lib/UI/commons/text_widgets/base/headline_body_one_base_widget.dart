import 'package:flutter/material.dart';
import 'package:demoapp/infrastructure/commons/constants/font_constant.dart';

class HeadlineBodyOneBaseWidget extends StatelessWidget {
   const HeadlineBodyOneBaseWidget({Key? key,

    required this.title,
    this.titleColor = Colors.black,
    this.titleTextAlign = TextAlign.left,
    required this.maxline,
    required this.fontWeight,required this.textOverflow,required this.fontSize
  }) : super(key: key);
  final String title;
  final Color titleColor;
  final TextAlign titleTextAlign;
  final int maxline;
  final FontWeight fontWeight;
  final TextOverflow textOverflow;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
          color: titleColor, fontSize: fontSize, fontWeight: fontWeight, fontFamily: FontConstant.latoRegular),
      textAlign: titleTextAlign,
      maxLines: maxline,
      overflow: textOverflow,
      softWrap: true,
    );
  }
}
