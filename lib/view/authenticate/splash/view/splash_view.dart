import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learn_language/core/base/view/base_view.dart';
import 'package:learn_language/core/constants/image/image_constants.dart';
import 'package:learn_language/view/authenticate/splash/viewmodel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
        viewModel: SplashViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, SplashViewModel value) =>
            Scaffold(
              body: SafeArea(
                child: Center(
                  child: Image.asset(
                    ImageConstants.instance.splashImage,
                    width: 110,
                    height: 110,
                  ),
                ),
              ),
            ));
  }
}
