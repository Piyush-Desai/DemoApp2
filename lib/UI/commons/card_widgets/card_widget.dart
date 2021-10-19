import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final EdgeInsets padding;
  final double elevation;
  final Widget child;
  final Function onTap;

  const CardWidget(
      {required Key key,required this.padding,required this.elevation, required this.child,required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Material(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2))),
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onTap,
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
