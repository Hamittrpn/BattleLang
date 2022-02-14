import 'package:flutter/material.dart';

import '../../../constants/app/app_constants.dart';
import '../app_theme.dart';
import 'dark_theme_interface.dart';

class AppThemeDark extends AppTheme with IDarkTheme {
  static AppThemeDark? _instance;

  static AppThemeDark get instance {
    return _instance ??= AppThemeDark._init();
  }

  AppThemeDark._init();

  @override
  ThemeData get theme => ThemeData(
        fontFamily: ApplicationConstants.FONT_FAMILY,
        scaffoldBackgroundColor: const Color(0xff211211),
        colorScheme: _appColorSheme(),
        textTheme: textTheme(),
        buttonTheme: ButtonThemeData(
          buttonColor: _appColorSheme().secondary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            elevation: 0,
            selectedItemColor: _appColorSheme().primary,
            selectedIconTheme: IconThemeData(color: _appColorSheme().primary),
            unselectedLabelStyle: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: _appColorSheme().onSurface),
            selectedLabelStyle: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: _appColorSheme().onSurface),
            unselectedItemColor: _appColorSheme().onSurface),
        appBarTheme: ThemeData.dark().appBarTheme.copyWith(
            iconTheme:
                IconThemeData(color: _appColorSheme().onBackground, size: 24)),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: _appColorSheme().onBackground,
          filled: true,
          hintStyle: TextStyle(fontSize: 12, color: _appColorSheme().onSurface),
          labelStyle:
              TextStyle(fontSize: 13, color: _appColorSheme().onSurface),
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
        labelColor: _appColorSheme().onSurface,
        labelPadding: EdgeInsets.zero,
        labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: ApplicationConstants.FONT_FAMILY),
        unselectedLabelColor: _appColorSheme().onSurface);
  }

  TextTheme textTheme() {
    return TextTheme(
        button: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: _appColorSheme().onSurface),
        bodyText1: textThemeDark.body,
        bodyText2: textThemeDark.bodySmall,
        caption: textThemeDark.caption1,
        overline: textThemeDark.title,
        headline6: textThemeDark.h7,
        headline3: textThemeDark.h3);
  }

  ColorScheme _appColorSheme() {
    return const ColorScheme(
        primary: Color(0xff097770),
        onPrimary: Color(0xffa9c0a6),
        secondary: Color(0xffedca82),
        onSecondary: Color(0xffe0cdbe),
        background: Color(0xff211211),
        onBackground: Color(0xff211211),
        surface: Color(0xffE5E5E5),
        onSurface: Color(0xffedca82),
        error: Color(0xffFF1F1F),
        onError: Colors.white,
        brightness: Brightness.dark);
  }
}
