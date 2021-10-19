import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:demoapp/infrastructure/commons/constants/font_constant.dart';

class HeadlineFiveBaseWidget extends StatelessWidget {
  const HeadlineFiveBaseWidget({Key? key,
    required this.title,
    this.titleColor = Colors.black,
    this.titleTextAlign = TextAlign.center,
    this.maxLine = 2,
    this.resizeTextForLongerText = true,
    this.showDotsForOverflow = true,
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
      maxLines: maxLine,
      style: Theme.of(context).textTheme.headline5!.copyWith(
          color: titleColor, fontSize: 24, fontWeight: fontWeight, fontFamily: FontConstant.latoBold),
      overflow: showDotsForOverflow == true ? TextOverflow.ellipsis : null,
      textAlign: titleTextAlign,
      minFontSize: resizeTextForLongerText == true ? 0 : 24,
    );
  }
}

//  return AutoSizeText(
//     !title.isEmptyStringExtension() ? title : "",
//     maxLines: maxLine,
//     overflow: TextOverflow.ellipsis,
//     style: Theme.of(context).textTheme.subtitle2.apply(
//           color: titleColor,
//         ),
//     textAlign: titleTextAlign,
//   );
