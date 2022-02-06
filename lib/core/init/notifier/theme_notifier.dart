import 'package:flutter/material.dart';

import '../../constants/enum/app_theme_enum.dart';
import '../theme/dark/app_theme_dark.dart';
import '../theme/light/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData? _currentTheme = AppThemeLight.instance.theme;
  ThemeData? get currentTheme => _currentTheme;
  AppThemes _currenThemeEnum = AppThemes.LIGHT;

  void changeValue(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = AppThemeLight.instance.theme;
      _currenThemeEnum = AppThemes.LIGHT;
    } else {
      _currentTheme = AppThemeDark.instance.theme;
      _currenThemeEnum = AppThemes.DARK;
    }
    notifyListeners();
  }

  /// Applicaton theme enum.
  /// Deafult value is [AppThemes.LIGHT]
  AppThemes get currenThemeEnum => _currenThemeEnum;
  void changeTheme(AppThemes theme) {
    if (_currenThemeEnum == AppThemes.LIGHT) {
      _currentTheme = ThemeData.dark();
      _currenThemeEnum = AppThemes.DARK;
    } else {
      _currentTheme = AppThemeLight.instance.theme;
      _currenThemeEnum = AppThemes.LIGHT;
    }
    notifyListeners();
  }
}
