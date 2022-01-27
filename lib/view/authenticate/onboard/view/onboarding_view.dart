import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/text/locale_text.dart';
import '../../../../core/constants/image/image_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/onboarding_viewmodel.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardingViewModel>(
      viewModel: OnBoardingViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, OnBoardingViewModel viewModel) =>
          Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: LocaleKeys.onboard_title1.tr(),
              body: LocaleKeys.onboard_body1.tr(),
              image: SvgPicture.asset(
                ImageConstants.instance.onboardImage1,
              ),
              decoration: getPageDecoration(context),
            ),
            PageViewModel(
              title: LocaleKeys.onboard_title2.tr(),
              body: LocaleKeys.onboard_body2.tr(),
              image: SvgPicture.asset(
                ImageConstants.instance.onboardImage2,
              ),
              decoration: getPageDecoration(context),
            ),
            PageViewModel(
              title: LocaleKeys.onboard_title3.tr(),
              body: LocaleKeys.onboard_body3.tr(),
              image: SvgPicture.asset(
                ImageConstants.instance.onboardImage3,
              ),
              decoration: getPageDecoration(context),
            ),
          ],
          dotsDecorator: getDotDecoration(context),
          color: context.colors.primary,
          globalBackgroundColor: context.colors.secondary,
          doneColor: context.colors.surface,
          showSkipButton: true,
          skip: LocaleText(
            text: context.locale.languageCode,
          ),
          onSkip: () => viewModel.changeApplicationLanguage(),
          done: const LocaleText(
            text: LocaleKeys.onboard_ready,
          ),
          onDone: viewModel.goToHome,
          showNextButton: false,
          controlsPadding: const EdgeInsets.symmetric(vertical: 8),
        ),
      ),
    );
  }

  DotsDecorator getDotDecoration(BuildContext context) => DotsDecorator(
      color: context.colors.surface,
      activeColor: context.colors.primary,
      size: const Size(10, 10),
      activeSize: const Size(22, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ));

  PageDecoration getPageDecoration(BuildContext context) => PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28,
          color: context.colors.primary,
          fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: 20, color: context.colors.surface),
      descriptionPadding: context.paddingAllDefaultScreen.copyWith(bottom: 0),
      imagePadding: context.paddingAllDefaultScreen,
      pageColor: context.colors.secondaryVariant);
}
