import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Function onPressed;
  final BoxBorder border;

  final double fontSize;

  const PrimaryButton({
    required Key key,
    required this.text,
    this.width = double.infinity,
    this.height = 50.0,
    required this.onPressed,
    required this.border,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 0.5),
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap:() => onPressed,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    color: onPressed == null ? Colors.white : Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: fontSize ?? 18.0),
              ),
            )),
      ),
    );
  }
}
