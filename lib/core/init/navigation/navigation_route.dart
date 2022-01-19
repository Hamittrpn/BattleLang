import 'package:flutter/material.dart';

import '../../../view/authenticate/onboard/view/onboarding_view.dart';
import '../../../view/home/test/view/test_view.dart';
import '../../components/card/not_found_navigation_card.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const OnBoardingScreen());
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(const TestScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigationCard(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
