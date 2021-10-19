import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HeadlineBodyTwoBaseWidget extends StatelessWidget {
  const HeadlineBodyTwoBaseWidget({
    required Key key,
    required this.title,
    this.titleColor = Colors.black,
    this.titleTextAlign = TextAlign.center,
    this.maxLine = 0,
    this.resizeTextForLongerText = false,
    required this.showDotsForOverflow,
    required this.fontWeight,
    required this.fontSize,
  }) : super(key: key);
  final String title;
  final Color titleColor;
  final TextAlign titleTextAlign;
  final int maxLine;
  final bool resizeTextForLongerText;
  final TextOverflow showDotsForOverflow;
  final FontWeight fontWeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title.isNotEmpty ? title : "",
      maxLines: maxLine > 0 ? maxLine : null,
      style: Theme.of(context).textTheme.bodyText2!.copyWith(
          color: titleColor,
          fontSize: fontSize,
          fontWeight: fontWeight),
      overflow: showDotsForOverflow ?? TextOverflow.ellipsis,
      textAlign: titleTextAlign,
      minFontSize: resizeTextForLongerText == true ? 0 : 12,
    );
  }
}
