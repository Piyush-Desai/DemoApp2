import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:demoapp/infrastructure/commons/constants/color_constants.dart';
import 'package:demoapp/infrastructure/commons/constants/font_constant.dart';
import 'package:demoapp/infrastructure/commons/constants/image_constants.dart';

class RaisedBtn extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;
  final Color buttonColor;
  final double elevation;
  final Color textColor;
  final double radius;
  final double padding;

  const RaisedBtn(
      {Key? key, required this.onPressed,
      required this.text,
      required this.elevation,
      required this.textColor,
      required this.radius,
      required this.padding,
      required this.buttonColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: elevation,
      padding: const EdgeInsets.all(12.0),
      color: buttonColor,
      textColor: textColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Center(
              child: Text(
            text,
            style: const TextStyle(fontFamily: "FuturaMedium", fontSize: 16.0),
          )),
        ),
      ),
    );
  }
}

class FlatBtn extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;
  final Color color;

  const FlatBtn({Key? key, required this.onPressed, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(text, style: const TextStyle(fontFamily: "FuturaMedium")),
      onPressed: onPressed,
    );
  }
}

class BorderBtn extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;

  const BorderBtn({Key? key, required this.onPressed, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      onPressed: onPressed,
      borderSide: BorderSide(color: Theme.of(context).primaryColor),
      textColor: Theme.of(context).primaryColor,
      child: Text(text, style: const TextStyle(fontFamily: "FuturaMedium")),
    );
  }
}

class BorderedBtn extends StatelessWidget {
  final GestureTapCallback? onPressed;
  final String? text;
  final double? elevation;
  final Color? textColor;
  final double? padding;

  const BorderedBtn({Key? key,
    this.onPressed,
    this.text,
    this.elevation,
    this.textColor,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(
          elevation ?? 8.0,
        ),
        fixedSize: MaterialStateProperty.all(
            Size(MediaQuery.of(context).size.width, 60)),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: padding!,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.white,
        ),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            color: textColor,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(
              color: textColor!,
            ),
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text!,
        style: const TextStyle(
          fontFamily: FontConstant.latoRegular,
        ),
      ),
    );
  }
}

class MaterialBtn extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;
  final Color color;
  final Color textColor;
  final double padding;

  const MaterialBtn(
      {Key? key, required this.onPressed,
      required this.text,
      required this.color,
      required this.padding,
      required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      textColor: textColor,
      child: Padding(
        padding:
            padding != null ? EdgeInsets.all(padding) : const EdgeInsets.all(0.0),
        child: Text(text, style: const TextStyle(fontFamily: "FuturaMedium")),
      ),
      color: color,
    );
  }
}

class GradientBtn extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;
  final double elevation;
  final Color textColor;
  final double radius;
  final double padding;
  bool isTrailingVisible = false;
  bool isGradient;
  final VoidCallback? onTapSuffix;

  GradientBtn({Key? key,
    required this.onPressed,
    required this.text,
    required this.elevation,
    required this.textColor,
    required this.radius,
    required this.padding,
    this.isTrailingVisible = false,
    this.isGradient = true,
    this.onTapSuffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: RaisedButton(
            elevation: elevation,
            padding: const EdgeInsets.all(0),
            textColor: textColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  radius,
                ),
              ),
              side: isGradient ? const BorderSide(color: ColorConstants.sortButtonActiveColor) : const BorderSide(),
            ),
            onPressed: onPressed,
            child: Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                gradient: isGradient
                    ? LinearGradient(colors: ColorConstants.buttonGradientColor)
                    : null,
                color: isGradient ? null : Colors.white,
              ),
              child: Center(
                  child: Text(
                text,
                style: const TextStyle(
                  fontFamily: "FuturaMedium",
                  fontSize: 16.0,
                ),
              )),
            ),
          ),
        ),
        isTrailingVisible
            ? Positioned(
                right: 25,
                top: 8,
                child: InkWell(
                  onTap: onTapSuffix,
                  child: CircleAvatar(
                    backgroundColor: ColorConstants.transparentColor,
                    radius: 20,
                    child: SvgPicture.asset(ImageConstants.right_arrow),
                  ),
                ))
            : Container()
      ],
    );
  }
}
