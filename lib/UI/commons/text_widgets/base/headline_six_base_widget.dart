import 'package:flutter/material.dart';

class HeadlineSixBaseWidget extends StatelessWidget {
  const HeadlineSixBaseWidget({
    required Key key,
    required this.title,
    this.titleColor = Colors.black,
    this.titleTextAlign = TextAlign.center,
    required this.maxLine,
    required this.fontWeight
  }) : super(key: key);
  final String title;
  final Color titleColor;
  final TextAlign titleTextAlign;
  final int maxLine;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline6!.copyWith(
            color: titleColor,
        fontWeight: fontWeight,
        fontSize: 20
          ),
      textAlign: titleTextAlign,
      maxLines: maxLine,
    );
  }
}
