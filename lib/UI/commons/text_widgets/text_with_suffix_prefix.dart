import 'package:flutter/material.dart';

class TextWithSuffixPrefix extends StatelessWidget {

  final Widget prefix;
  final Widget suffix;
  final Widget child;
  final double suffixSpace;
  final double prefixSpace;

  const TextWithSuffixPrefix({required Key key,required  this.prefix,required  this.suffix,required this.child,required this.prefixSpace,required this.suffixSpace}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        prefix,
        SizedBox(width: prefixSpace,),
        child,
        SizedBox(width: suffixSpace,),
        suffix,
      ],
    );
  }
}
