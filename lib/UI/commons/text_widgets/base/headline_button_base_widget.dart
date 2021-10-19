import 'package:flutter/material.dart';

class HeadlineBodyButtonBaseWidget extends StatelessWidget {
  const HeadlineBodyButtonBaseWidget({
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
      style: Theme.of(context)
          .textTheme
          .button!
          .copyWith(color: titleColor, fontWeight: fontWeight,fontSize: 14)
          .copyWith(decoration: TextDecoration.underline),
    );
  }
}
