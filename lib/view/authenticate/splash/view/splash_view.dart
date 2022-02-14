import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/image/image_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/utils.dart';
import '../viewmodel/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  ConnectivityResult result = ConnectivityResult.none;
  bool? hasInternet;
  StreamSubscription? subscription;
  @override
  void initState() {
    super.initState();
    subscription =
        Connectivity().onConnectivityChanged.listen(showConnectivitySnackBar);
  }

  @override
  void dispose() {
    subscription!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.secondary,
      body: buildHomeView(context),
    );
  }

  BaseView<SplashViewModel> buildHomeView(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SplashViewModel value) => SafeArea(
        child: Center(
          child: Image.asset(
            ImageConstants.instance.splashImage,
            width: 110,
            height: 110,
          ),
        ),
      ),
    );
  }

  void showConnectivitySnackBar(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;
    final message = hasInternet
        ? 'You have again ${result.toString()}'
        : 'You have no internet';
    final color = hasInternet
        ? const Color.fromARGB(255, 49, 122, 51)
        : const Color.fromARGB(255, 172, 45, 36);

    Utils.showTopSnackBar(context, message, color);
  }
}
