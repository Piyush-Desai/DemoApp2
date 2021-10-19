import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:demoapp/UI/commons/InternationalPhoneInput/models/country_model.dart';
import 'package:demoapp/UI/commons/InternationalPhoneInput/utils/util.dart';
import 'package:demoapp/infrastructure/commons/constants/image_constants.dart';

/// [Item]
class Item extends StatelessWidget {
  final Country? country;
  final bool? showFlag;
  final bool? useEmoji;
  final TextStyle? textStyle;
  final bool withCountryNames;
  final double? leadingPadding;
  final bool trailingSpace;

  const Item({
    Key? key,
    this.country,
    this.showFlag,
    this.useEmoji,
    this.textStyle,
    this.withCountryNames = false,
    this.leadingPadding = 12,
    this.trailingSpace = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dialCode = (country?.phoneCode ?? '');
    if (trailingSpace) {
      dialCode = dialCode.padRight(5, "   ");
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(width: 5),
        _Flag(
          country: country,
          showFlag: showFlag,
          useEmoji: useEmoji,
        ),
        const SizedBox(width: 6.0),
        SvgPicture.asset(ImageConstants.down_arrow),
        const SizedBox(width: 6.0),
        Text(
          dialCode,
          textDirection: TextDirection.ltr,
          style: textStyle,
        ),
        const SizedBox(width: 4.0),
        Container(
          width: 1.0,
          height: 24.0,
          color: Colors.grey,
        ),
      ],
    );
  }
}

class _Flag extends StatelessWidget {
  final Country? country;
  final bool? showFlag;
  final bool? useEmoji;

  const _Flag({Key? key, this.country, this.showFlag, this.useEmoji})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return country != null && showFlag!
        ? Container(
      child: useEmoji!
          ? Text(
        Utils.generateFlagEmojiUnicode(country?.countryCode ?? ''),
        style: Theme.of(context).textTheme.headline5,
      )
          :
      Container(
        decoration: ShapeDecoration(
          image: DecorationImage(
            image: AssetImage(
              //country!.flagUri,
              'assets/flags/${country?.countryCode!.toLowerCase()}.png',
            ),
            fit: BoxFit.fill,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        width: 24.0,
        height: 24.0,
      ),
    )
        : const SizedBox.shrink();
  }
}
