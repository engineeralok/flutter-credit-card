import 'package:flutter/material.dart';

Color primaryBlue = const Color(0xff2972ff);
Color textBlack = const Color(0xff222222);
Color textGrey = const Color(0xff94959b);
Color textWhiteGrey = const Color(0xfff1f1f5);

TextStyle heading2 = const TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

TextStyle heading5 = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

TextStyle heading6 = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

TextStyle regular16pt = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

ThemeData appTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.lightBlue,
    primaryColor: const Color(0xFF3F0E40), // Slack's purple color
    fontFamily: 'Lato',
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.white, // White app bar background
      elevation: 0, // No shadow
      iconTheme: IconThemeData(
        color: Color(0xFF333333), // Dark gray app bar icons
      ),
      titleTextStyle: TextStyle(
        color: Color(0xFF333333), // Dark gray app bar text
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
