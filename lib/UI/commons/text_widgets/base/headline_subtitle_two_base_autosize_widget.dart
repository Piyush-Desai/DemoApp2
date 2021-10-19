import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HeadlineSubTitleTwoBaseAutoSizeWidget extends StatelessWidget {
  const HeadlineSubTitleTwoBaseAutoSizeWidget({
    required Key key,
    required this.title,
    this.titleColor = Colors.black,
    this.titleTextAlign = TextAlign.center,
    this.maxLine = 2,
    this.resizeTextForLongerText = false,
    this.showDotsForOverflow = false,
    required this.fontWeight
  }) : super(key: key);
  final String title;
  final Color titleColor;
  final TextAlign titleTextAlign;
  final int maxLine;
  final bool resizeTextForLongerText;
  final bool showDotsForOverflow;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title.isNotEmpty ? title : "",
      maxLines: maxLine > 0 ? maxLine : null,
      style: Theme.of(context).textTheme.subtitle2!.copyWith(
          color: titleColor, fontWeight: fontWeight, fontSize: 14),
      overflow: showDotsForOverflow == true ? TextOverflow.ellipsis : null,
      textAlign: titleTextAlign,
      minFontSize: resizeTextForLongerText == true ? 0 : 14,
    );
  }
}
