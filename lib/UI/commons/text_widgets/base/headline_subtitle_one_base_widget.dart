import 'package:flutter/material.dart';

class HeadlineSubTitleOneBaseWidget extends StatelessWidget {
  const HeadlineSubTitleOneBaseWidget({
    required Key key,
    required this.title,
    this.titleColor = Colors.black,
    this.titleTextAlign = TextAlign.center,
    required this.fontWeight
  }) : super(key: key);
  final String title;
  final Color titleColor;
  final TextAlign titleTextAlign;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: titleTextAlign,
      style: Theme.of(context).textTheme.subtitle1!.copyWith(
          color: titleColor, fontSize: 16, fontWeight: fontWeight),
    );
  }
}
