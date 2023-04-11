import 'package:flutter/material.dart';

final myThemeData = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFFF6F7FB),
  textTheme: const TextTheme(
    bodyText1: TextStyle(),
    bodyText2: TextStyle(),
    headline1: TextStyle(),
    headline2: TextStyle(),
    headline3: TextStyle(),
    headline4: TextStyle(),
    headline5: TextStyle(),
    headline6: TextStyle(),
    caption: TextStyle(),
    overline: TextStyle(),
    button: TextStyle(),
  ).apply(
    bodyColor: const Color(0xFF324458),
    displayColor: const Color(0xFF324458),
    decorationColor: const Color(0xFF324458),
  ),
);
