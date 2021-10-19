import 'package:flutter/material.dart';

class CaptionBaseWidget extends StatelessWidget {
  const CaptionBaseWidget({
    required Key key,
    required this.title,
    this.titleColor = Colors.black,
    this.titleTextAlign = TextAlign.left,
    required this.maxline,
  }) : super(key: key);
  final String title;
  final Color titleColor;
  final TextAlign titleTextAlign;
  final int maxline;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.caption!.apply(
            color: titleColor,
          ),
      textAlign: titleTextAlign,
      maxLines: maxline,
      overflow: TextOverflow.ellipsis,
    );
  }
}
