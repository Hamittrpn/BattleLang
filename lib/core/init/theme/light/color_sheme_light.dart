import 'package:flutter/material.dart';

class ColorShemeLight {
  static ColorShemeLight? _instance;
  static ColorShemeLight get instance {
    _instance ??= ColorShemeLight._init();
    return _instance!;
  }

  ColorShemeLight._init();

  final Color brown = const Color(0xffa87e6f);
  final Color red = const Color(0xffc10e0e);
  final Color white = const Color(0xffffffff);
  final Color gray = const Color(0xffE5E5E5);
  final Color lightGray = const Color(0xfff7f7f7);
  final Color darkGray = const Color(0xff676870);
  final Color black = const Color(0xff020306);
  final Color azure = const Color(0xff27928d);
  final Color pink = const Color(0xffCC2B5E);

  final Color borderColor = const Color(0xffBABABA);
}
