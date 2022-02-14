import 'package:flutter/material.dart';
import 'package:learn_language/core/constants/image/image_constants.dart';
import 'package:lottie/lottie.dart';

import '../../extensions/context_extension.dart';
import '../text/locale_text.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.onSecondary,
      body: Padding(
        padding: context.paddingHorizontalDefaultScreen,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              ImageConstants.instance.connectivity,
              width: context.screenWidth * 0.6,
            ),
            LocaleText(
              text: 'No Internet Connection',
              style: context.textTheme.headline4!
                  .copyWith(color: context.colors.onPrimary),
            ),
            Padding(
              padding: EdgeInsets.only(top: context.normalValue),
              child: LocaleText(
                textAlign: TextAlign.center,
                text:
                    'You are not connected to the internet. Make sure Wi-fi is on, Airplane mode is Off ',
                style: context.textTheme.headline6!
                    .copyWith(color: context.colors.surface),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
