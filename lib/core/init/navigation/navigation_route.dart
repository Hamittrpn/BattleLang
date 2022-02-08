import 'package:flutter/material.dart';

import '../../../view/authenticate/auth/view/auth_view.dart';
import '../../../view/authenticate/onboard/view/onboarding_view.dart';
import '../../../view/authenticate/register/view/forgor_password_view.dart';
import '../../../view/authenticate/register/view/verify_email_view.dart';
import '../../../view/home/feed-details/view/feed_detail_view.dart';
import '../../../view/home/feed/view/feed_view.dart';
import '../../../view/home/home_view.dart';
import '../../../view/home/test/view/test_view.dart';
import '../../components/card/not_found_navigation_card.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT_VIEW:
        return normalNavigate(const HomeView());
      case NavigationConstants.ON_BOARDING_VIEW:
        return normalNavigate(const OnBoardingView());
      case NavigationConstants.FEED_VIEW:
        return normalNavigate(const FeedView());
      case NavigationConstants.CHALLENGE_DETAIL_VIEW:
        return normalNavigate(const ChallengeDetailView());
      case NavigationConstants.FORGOT_PASSWORD_VIEW:
        return normalNavigate(const ForgotPasswordView());
      case NavigationConstants.AUTH_VIEW:
        return normalNavigate(const AuthView());
      case NavigationConstants.EMAIL_VERIFIED_VIEW:
        return normalNavigate(const VerifyEmailView());
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(const TestView());
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
