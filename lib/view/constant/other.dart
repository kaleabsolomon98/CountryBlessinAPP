import 'package:countyourblessings/view/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final customDivider = Container(
  height: 1,
  width: Get.width,
  color: kLightGreyColor.withOpacity(0.5),
);

final colan = Image.asset(
  'assets/images/collan.png',
  height: 31,
);

var gradientBg = BoxDecoration(
  borderRadius: BorderRadius.circular(100),
  boxShadow: [
    BoxShadow(
      color: kTertiaryColor.withOpacity(0.16),
      offset: const Offset(0, 10),
      blurRadius: 22,
    ),
  ],
  gradient: const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffF55E8D),
      Color(0xffFB81A6),
    ],
  ),
);

class TextFieldStyling {
  static const textStyle = TextStyle(
    fontSize: 16,
    color: kBlackColor,
  );
  static const labelStyle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
    color: kBlackColor,
  );
  static const hintStyle = TextStyle(
    fontSize: 16,
    color: kBlackColor,
  );
  static const noBorder = InputBorder.none;
}

class AppStyling {
  static final appStyling = ThemeData(
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: kPrimaryColor,
    highlightColor: kPrimaryColor.withOpacity(0.1),
    splashColor: kPrimaryColor.withOpacity(0.1),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: kPrimaryColor,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: kSecondaryColor.withOpacity(0.1),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: kBlackColor,
    ),
  );
}
