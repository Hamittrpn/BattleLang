import 'package:flutter/material.dart';

import '../../../constants/app/app_constants.dart';
import '../app_theme.dart';
import 'light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;

  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
        fontFamily: ApplicationConstants.FONT_FAMILY,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: _appColorSheme(),
        textTheme: textTheme(),
        buttonTheme: ButtonThemeData(
          buttonColor: _appColorSheme().primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            elevation: 0,
            selectedItemColor: _appColorSheme().primary,
            selectedIconTheme: IconThemeData(color: _appColorSheme().primary),
            unselectedLabelStyle: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Color(0xff130A1A)),
            selectedLabelStyle: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Color(0xff130A1A)),
            unselectedItemColor: const Color(0xff2D3033)),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
            iconTheme: const IconThemeData(color: Colors.black87, size: 24)),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: _appColorSheme().onBackground,
          filled: true,
          hintStyle: TextStyle(fontSize: 12, color: _appColorSheme().surface),
          labelStyle: TextStyle(fontSize: 13, color: _appColorSheme().surface),
          errorStyle: TextStyle(color: _appColorSheme().error),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 15.5),
          hoverColor: _appColorSheme().onSecondary,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: _appColorSheme().secondary),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: _appColorSheme().primary),
          ),
        ),
        tabBarTheme: tabBarTheme,
      );

  TabBarTheme get tabBarTheme {
    return TabBarTheme(
        labelColor: Colors.black,
        labelPadding: EdgeInsets.zero,
        labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: ApplicationConstants.FONT_FAMILY),
        unselectedLabelColor: Colors.black.withOpacity(0.6));
  }

  TextTheme textTheme() {
    return TextTheme(
        button: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        bodyText1: textThemeLight.body,
        bodyText2: textThemeLight.bodySmall,
        caption: textThemeLight.caption1,
        overline: textThemeLight.title,
        headline6: textThemeLight.h7,
        headline3: textThemeLight.h3);
  }

  ColorScheme _appColorSheme() {
    return const ColorScheme(
        primary: Color(0xff097770),
        onPrimary: Color(0xffa9c0a6),
        secondary: Color(0xffedca82),
        onSecondary: Color(0xffe0cdbe),
        background: Color(0xffE5E5E5),
        onBackground: Colors.white,
        surface: Color(0xff211211),
        onSurface: Color(0xff211211),
        error: Color(0xffFF1F1F),
        onError: Colors.white,
        brightness: Brightness.light);
  }
}
