import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorConstants {
  static const appBackgroundColor = Colors.white;
  static List<Color> colorSecondaryButtonGradient = const <Color>[
    Color(0xFF57DBF1),
    Color(0xFF03AEC3)
  ];
  static List<Color> colorprimaryButtonGradient = const <Color>[
    Color(0xFF4e4d4d),
    Color(0xFF313131),
    Color(0xFF212121),
    Color(0xFF000000)
  ];

  static  List<Color> buttonGradientColor = [
    Color(0xFF1C4978).withOpacity(0.9),
    Color(0xFF143559).withOpacity(0.9)
  ];
  static const Color orangeColor = Color(0xFFF7A479);
  static const facebookButtonColor = Color(0XFF3b66c3);
  static const googleButtonColor = Color(0XFFcf4332);
  static const blueTextColor = Color(0XFF577ae1);
  static const primaryColor = Color(0xFF1e517f);
  static const transparentColor = Colors.transparent;
  static const grayBlack = Color(0XFF2a2a2a);
  static const dividerColor = Color(0XFFF3F3F3);
  static const blueColor = Colors.blue;
  static const Color white = Colors.white;
  static const Color primaryGrey = Color(0xFF7F7F7F) ;
  static const Color seperatorColor = Color(0xFF707070) ;
  static const Color primaryGreyLight = Color(0xFFECECEC) ;
  static const Color itemCountBackgroundColor = Color(0xFFDCDCDC) ;
  static MaterialColor mprimaryColor = const MaterialColor(
    0xFFFFFFFF,
    const <int, Color>{
      50: Colors.white,
      100:  Colors.white,
      200:  Colors.white,
      300:  Colors.white,
      400:  Colors.white,
      500:  Colors.white,
      600:  Colors.white,
      700:  Colors.white,
      800:  Colors.white,
      900:  Colors.white,
    },
  );
  static const Color blackTextColor = Colors.black;
  static Color disableFieldColor = Colors.grey.shade300;
  static var greyColor = Colors.grey;

  static const Color editBackgroundColor = Color(0xFF59CF85);
  static const Color deleteBackgroundColor = Color(0xFFDD1922);
  static const Color moveBackgroundColor = Color(0xFFFEB824);
  static const Color editTextBackgroundColor = Color(0xFFE3E3E3);

  //static const Color sortButtonActiveColor  = Color(0xFF59CF85);
  static const Color sortButtonActiveColor  = Color(0xFF355DAA);
  //static const Color sortButtonDisabledColor = Color(0xFFF7C5C7);
  static const Color sortButtonDisabledColor = Colors.grey;

  static const Color sortSwitchActiveColor = Color(0xFF355DAA);
  static const Color sortSwitchDeActiveColor = Color(0xFFFEFEFF);

  static const Color signUpBackgroundColor = Color(0xFFF6F8FD);
  static const Color textFormFieldBorderColor = Color(0xFFE8F1F9);
  static const Color profilePictureColor = Color(0xFF2575BB);
  static const Color profileHeadingColor = Color(0xFF4A596F);
  static const Color popUpGreyColor = Color(0xFFDCE1E9);

  static const Color bottomNavBarColor = Color(0xFFDCE1E9);
  static const settingsDividerColor = Color(0XFFE1E5E8);
}
