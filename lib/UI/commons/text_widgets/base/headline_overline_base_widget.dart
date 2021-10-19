import 'package:flutter/material.dart';

class HeadlineOverlineBaseWidget extends StatelessWidget {
  const HeadlineOverlineBaseWidget({
    required Key key,
    required this.title,
    this.titleColor = Colors.black,
    this.titleTextAlign = TextAlign.center,
  }) : super(key: key);
  final String title;
  final Color titleColor;
  final TextAlign titleTextAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.overline!.apply(
            color: titleColor,
          ),
      textAlign: titleTextAlign,
    );
  }
}
