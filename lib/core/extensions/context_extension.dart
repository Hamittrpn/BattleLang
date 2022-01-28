import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get screenHeight => mediaQuery.size.height;
  double get screenWidth => mediaQuery.size.width;

  double get lowValue => screenHeight * 0.01;
  double get normalValue => screenHeight * 0.02;
  double get mediumValue => screenHeight * 0.04;
  double get highValue => screenHeight * 0.1;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
}

extension PaddingExtensiomAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}

extension PaddingExtensiomSymetric on BuildContext {
  EdgeInsets get paddingLowHorizontal =>
      EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get paddingNormalHorizontal =>
      EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get paddingMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingHighHorizontal =>
      EdgeInsets.symmetric(horizontal: highValue);

  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get paddingNormalVertical =>
      EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get paddingMediumVertical =>
      EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get paddingHighVertical =>
      EdgeInsets.symmetric(vertical: highValue);
}

extension PaddingExtensionScreenDefault on BuildContext {
  EdgeInsets get paddingHorizontalDefaultScreen =>
      const EdgeInsets.symmetric(horizontal: 16);
  EdgeInsets get paddingVerticalDefaultScreen =>
      const EdgeInsets.symmetric(vertical: 16);
  EdgeInsets get paddingAllDefaultScreen => const EdgeInsets.all(16);
}

extension PaddingExtensionFormField on BuildContext {
  EdgeInsets get paddingHorizontalForm =>
      const EdgeInsets.symmetric(horizontal: 12);
  EdgeInsets get paddingVerticalForm =>
      const EdgeInsets.symmetric(vertical: 12);
  EdgeInsets get paddingAllForm => const EdgeInsets.all(12);
}

extension DurationExtension on BuildContext {
  Duration get lowDuration => const Duration(milliseconds: 300);
  Duration get mediumDuration => const Duration(milliseconds: 500);
  Duration get highDuration => const Duration(seconds: 1);
  Duration get veryHighDuration => const Duration(milliseconds: 1500);
}
