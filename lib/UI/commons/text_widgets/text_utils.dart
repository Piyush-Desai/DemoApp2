import 'package:flutter/material.dart';

class CaptionText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign align;
  final int maxLine;

  const CaptionText({Key? key, required this.text,required  this.color,required  this.align,required  this.maxLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: align,
      style: style(context).copyWith(fontSize: 10),
      maxLines: maxLine,
    );
  }

  TextStyle style(BuildContext context) {

      return Theme.of(context)
          .textTheme
          .caption!
          .copyWith(color: color, fontFamily: "FuturaMedium");

  }
}

class SmallText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign align;
  final int maxLine;

  const SmallText({Key? key, required this.text, required this.color,required  this.align, required this.maxLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: align,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 12.0, color: color),
      maxLines: maxLine,
    );
  }
}

class SmallVerifyText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign align;
  final int maxLine;

  const SmallVerifyText({Key? key, required this.text,required  this.color,required  this.align,required  this.maxLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: align,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
          fontSize: 14.0,
          color: Colors.red,
          ),
      maxLines: maxLine,
    );
  }
}

class Body1Text extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign align;
  final TextOverflow textOverflow;
  final int maxLine;
  final int fontSize;
  final String fontFamily;

  const Body1Text(
      {Key? key, required this.text,
      required this.color,
      required this.align,
      required this.textOverflow,
      required this.maxLine,
      this.fontSize = 14,
        required this.fontFamily}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: align,
      overflow: textOverflow,
      style: TextStyle(
          fontSize: fontSize+0.0, color: color, fontFamily: fontFamily),
      maxLines: maxLine,
    );
  }

  TextStyle style(BuildContext context) {

      return Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(color: color, );

  }
}

class Body2Text extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign align;
  final int maxLine;

  const Body2Text({Key? key, required this.text, required this.color,required  this.align, required this.maxLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: align,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: 14,
          color: color,
          fontWeight: FontWeight.w500,
          ),
      maxLines: maxLine,
    );
  }

  TextStyle style(BuildContext context) {

      return Theme.of(context).textTheme.bodyText2!.copyWith(color: color);

  }
}

class SubTitleText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign align;
  final int maxLine;

  const SubTitleText({Key? key, required this.text,required  this.color,required  this.align, required this.maxLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: align,
      style: style(context).copyWith(fontSize: 16, fontWeight: FontWeight.w600),
      maxLines: maxLine,
    );
  }

  TextStyle style(BuildContext context) {

      return Theme.of(context).textTheme.subtitle1!.copyWith(color: color);

  }
}

class TitleText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign align;
  final int maxLine;

  const TitleText({Key? key, required this.text,required  this.color,required  this.align,required  this.maxLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: false,
      textAlign: align,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 20.0,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: color,
        decoration: TextDecoration.none,
      ),
      maxLines: maxLine,
    );
  }

  TextStyle style(BuildContext context) {

      return Theme.of(context).textTheme.caption!.copyWith(color: color);

  }
}

class SubHeadText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign align;
  final int maxLine;

  const SubHeadText({Key? key, required this.text,required  this.color, required this.align, required this.maxLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      textAlign: align,
      style:
          TextStyle(fontSize: 20.0, color: color, ),
      maxLines: maxLine,
    );
  }
}

class HeadlineText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign align;
  final int maxLine;

  const HeadlineText({Key? key, required this.text,required  this.color, required this.align,required  this.maxLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: align,
      overflow: TextOverflow.ellipsis,
      style: style(context).copyWith(fontSize: 22, ),
      maxLines: maxLine,
    );
  }

  TextStyle style(BuildContext context) {

      return Theme.of(context).textTheme.headline1!.copyWith(color: color);

  }
}

class Display1Text extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign align;
  final int maxLine;

  const Display1Text({Key? key, required this.text, required this.color,required  this.align, required this.maxLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: align,
      overflow: TextOverflow.visible,
      style: style(context).copyWith(
          fontSize: 30,
          fontWeight: FontWeight.w500),
      maxLines: maxLine,
    );
  }

  TextStyle style(BuildContext context) {

      return Theme.of(context).textTheme.bodyText2!.copyWith(color: color);

  }
}
