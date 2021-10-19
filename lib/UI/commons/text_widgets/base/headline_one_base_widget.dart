import 'package:flutter/material.dart';

class HeadlineOneBaseWidget extends StatelessWidget {
  const HeadlineOneBaseWidget({
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
      style: Theme.of(context).textTheme.headline1!.copyWith(
          color: titleColor, fontSize: 96, fontWeight: fontWeight),
    );
  }
}
