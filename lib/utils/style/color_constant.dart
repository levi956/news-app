import 'package:flutter/material.dart';

Color purplePrimary = const Color(0xFF475AD7);
Color greyPrimary = const Color(0xFF7C82A1);
Color backgroundWhite = const Color(0xFFFCFCFC);
Color blackPrimary = const Color(0xFF333647);
Color blackLighter = const Color(0xFF555A77);
Color greyLighter = const Color(0xFFF3F4F6);
Color greyDarker = const Color(0xFF666C8E);
Color transparent = Colors.transparent;
Color greyishPurple = const Color(0xFFEEF0FB);

class Style {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      // background white
      scaffoldBackgroundColor:
          isDarkTheme ? Colors.black : const Color(0xFFFCFCFC),

      // purple Primary
      primaryColor:
          isDarkTheme ? const Color(0xFF475AD7) : const Color(0xFF475AD7),

      // primary black and white
      primaryColorDark:
          isDarkTheme ? const Color(0xFFFCFCFC) : const Color(0xFF333647),

      // primary greyish
      primaryColorLight:
          isDarkTheme ? const Color(0xFFF3F4F6) : const Color(0xFF7C82A1),
    );
  }
}
