import 'package:auto_route/annotations.dart';
import 'package:learn_language/view/authenticate/register/view/verify_email_view.dart';

import '../../../view/authenticate/auth/view/auth_view.dart';
import '../../../view/authenticate/login/view/login_view.dart';
import '../../../view/authenticate/onboard/view/onboarding_view.dart';
import '../../../view/authenticate/register/view/forgor_password_view.dart';
import '../../../view/authenticate/register/view/register_view.dart';
import '../../../view/authenticate/splash/view/splash_view.dart';
import '../../../view/home/challenge/view/challenges_view.dart';
import '../../../view/home/feed-details/view/feed_detail_view.dart';
import '../../../view/home/feed/view/feed_view.dart';
import '../../../view/home/home_view.dart';
import '../../../view/home/test/view/test_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashView, initial: true),
    AutoRoute(page: OnBoardingView),
    AutoRoute(page: AuthView),
    AutoRoute(page: RegisterView),
    AutoRoute(page: LoginView),
    AutoRoute(page: ForgotPasswordView),
    AutoRoute(page: HomeView),
    AutoRoute(page: FeedView),
    AutoRoute(page: ChallengesView),
    AutoRoute(page: ChallengeDetailView),
    AutoRoute(page: VerifyEmailView),
    AutoRoute(page: TestView),
  ],
)
class $AppRouter {}
