import 'package:flutter/material.dart';

class TextThemeLight {
  static TextThemeLight? _instance;
  static TextThemeLight get instance {
    _instance ??= TextThemeLight._init();
    return _instance!;
  }

  TextThemeLight._init();

  final TextStyle body = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.25,
    color: Color(0xff0A103D),
  );
  final TextStyle bodySmall = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Color(0xff0A103D),
    letterSpacing: 0.25,
  );
  final TextStyle title = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.25,
    color: Color(0xff0A103D),
  );

  final TextStyle caption1 = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Color(0xff0A103D),
    letterSpacing: 0.25,
  );

  final TextStyle caption2 = const TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: Color(0xff0A103D),
    letterSpacing: 0.25,
  );

  final TextStyle caption3 = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: Color(0xff0A103D),
    letterSpacing: 0.25,
  );

  final TextStyle h7 = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.25,
      color: Color(0xff0A103D));

  final TextStyle h3 = const TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.25,
      color: Color(0xff0A103D));

  final TextStyle headline1 = const TextStyle(
      fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5);
  final TextStyle headline2 = const TextStyle(
      fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5);
  final TextStyle headline3 =
      const TextStyle(fontSize: 48, fontWeight: FontWeight.w400);
  final TextStyle headline4 = const TextStyle(
      fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25);
  final TextStyle headline5 =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.w400);
  final TextStyle overline = const TextStyle(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5);
}
