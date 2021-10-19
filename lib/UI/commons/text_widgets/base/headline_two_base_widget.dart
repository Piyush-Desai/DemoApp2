import 'package:flutter/material.dart';

class HeadlineTwoBaseWidget extends StatelessWidget {
  const HeadlineTwoBaseWidget({
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
      style: Theme.of(context)
          .textTheme
          .headline2!
          .copyWith(color: titleColor, fontWeight: fontWeight,fontSize: 60),
    );
  }
}
