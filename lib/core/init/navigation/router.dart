import 'package:auto_route/annotations.dart';

import '../../../feature/authenticate/auth/view/auth_view.dart';
import '../../../feature/authenticate/login/view/login_view.dart';
import '../../../feature/authenticate/onboard/view/onboarding_view.dart';
import '../../../feature/authenticate/register/view/forgor_password_view.dart';
import '../../../feature/authenticate/register/view/register_view.dart';
import '../../../feature/authenticate/register/view/verify_email_view.dart';
import '../../../feature/authenticate/splash/view/splash_view.dart';
import '../../../feature/home/challenge/view/challenges_view.dart';
import '../../../feature/home/feed-details/view/feed_detail_view.dart';
import '../../../feature/home/feed/view/feed_view.dart';
import '../../../feature/home/home_view.dart';
import '../../../feature/test/view/test_view.dart';

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
