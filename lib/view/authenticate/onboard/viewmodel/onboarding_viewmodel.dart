import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enum/locale_keys_enum.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/lang/language_manager.dart';

part 'onboarding_viewmodel.g.dart';

class OnBoardingViewModel = _OnBoardingViewModelBase with _$OnBoardingViewModel;

abstract class _OnBoardingViewModelBase with Store, BaseViewModel {
  final languageManager = LanguageManager.instance;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}

  Future<void> goToHome() async {
    await localeManager.setBoolValue(PreferencesKeys.FIRST_OPEN, true);
    context!.router.pushNamed(NavigationConstants.AUTH_VIEW);
  }

  void changeApplicationLanguage() async {
    context!.setLocale(languageManager.supportedLocales[
        Random().nextInt(languageManager.supportedLocales.length)]);
  }
}
