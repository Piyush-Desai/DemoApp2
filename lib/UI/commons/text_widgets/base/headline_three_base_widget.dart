import 'package:flutter/material.dart';

class HeadlineThreeBaseWidget extends StatelessWidget {
  const HeadlineThreeBaseWidget({
    required Key key,
    required this.title,
    this.titleColor = Colors.black,
    required this.fontWeight
  }) : super(key: key);
  final String title;
  final Color titleColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline3!.copyWith(
          color: titleColor, fontSize: 48, fontWeight: fontWeight),
    );
  }
}
