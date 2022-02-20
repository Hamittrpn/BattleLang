// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;

import '../../../feature/authenticate/auth/view/auth_view.dart' as _i3;
import '../../../feature/authenticate/login/view/login_view.dart' as _i5;
import '../../../feature/authenticate/onboard/view/onboarding_view.dart' as _i2;
import '../../../feature/authenticate/register/view/forgor_password_view.dart'
    as _i6;
import '../../../feature/authenticate/register/view/register_view.dart' as _i4;
import '../../../feature/authenticate/register/view/verify_email_view.dart'
    as _i11;
import '../../../feature/authenticate/splash/view/splash_view.dart' as _i1;
import '../../../feature/home/challenge/view/challenges_view.dart' as _i9;
import '../../../feature/home/feed-details/view/feed_detail_view.dart' as _i10;
import '../../../feature/home/feed/view/feed_view.dart' as _i8;
import '../../../feature/home/home_view.dart' as _i7;
import '../../../feature/test/view/test_view.dart' as _i12;

class AppRouter extends _i13.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    SplashView.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashView());
    },
    OnBoardingView.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.OnBoardingView());
    },
    AuthView.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.AuthView());
    },
    RegisterView.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.RegisterView());
    },
    LoginView.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.LoginView());
    },
    ForgotPasswordView.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ForgotPasswordView());
    },
    HomeView.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.HomeView());
    },
    FeedView.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.FeedView());
    },
    ChallengesView.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.ChallengesView());
    },
    ChallengeDetailView.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.ChallengeDetailView());
    },
    VerifyEmailView.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.VerifyEmailView());
    },
    TestView.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.TestView());
    }
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(SplashView.name, path: '/'),
        _i13.RouteConfig(OnBoardingView.name, path: '/on-boarding-view'),
        _i13.RouteConfig(AuthView.name, path: '/auth-view'),
        _i13.RouteConfig(RegisterView.name, path: '/register-view'),
        _i13.RouteConfig(LoginView.name, path: '/login-view'),
        _i13.RouteConfig(ForgotPasswordView.name,
            path: '/forgot-password-view'),
        _i13.RouteConfig(HomeView.name, path: '/home-view'),
        _i13.RouteConfig(FeedView.name, path: '/feed-view'),
        _i13.RouteConfig(ChallengesView.name, path: '/challenges-view'),
        _i13.RouteConfig(ChallengeDetailView.name,
            path: '/challenge-detail-view'),
        _i13.RouteConfig(VerifyEmailView.name, path: '/verify-email-view'),
        _i13.RouteConfig(TestView.name, path: '/test-view')
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashView extends _i13.PageRouteInfo<void> {
  const SplashView() : super(SplashView.name, path: '/');

  static const String name = 'SplashView';
}

/// generated route for
/// [_i2.OnBoardingView]
class OnBoardingView extends _i13.PageRouteInfo<void> {
  const OnBoardingView()
      : super(OnBoardingView.name, path: '/on-boarding-view');

  static const String name = 'OnBoardingView';
}

/// generated route for
/// [_i3.AuthView]
class AuthView extends _i13.PageRouteInfo<void> {
  const AuthView() : super(AuthView.name, path: '/auth-view');

  static const String name = 'AuthView';
}

/// generated route for
/// [_i4.RegisterView]
class RegisterView extends _i13.PageRouteInfo<void> {
  const RegisterView() : super(RegisterView.name, path: '/register-view');

  static const String name = 'RegisterView';
}

/// generated route for
/// [_i5.LoginView]
class LoginView extends _i13.PageRouteInfo<void> {
  const LoginView() : super(LoginView.name, path: '/login-view');

  static const String name = 'LoginView';
}

/// generated route for
/// [_i6.ForgotPasswordView]
class ForgotPasswordView extends _i13.PageRouteInfo<void> {
  const ForgotPasswordView()
      : super(ForgotPasswordView.name, path: '/forgot-password-view');

  static const String name = 'ForgotPasswordView';
}

/// generated route for
/// [_i7.HomeView]
class HomeView extends _i13.PageRouteInfo<void> {
  const HomeView() : super(HomeView.name, path: '/home-view');

  static const String name = 'HomeView';
}

/// generated route for
/// [_i8.FeedView]
class FeedView extends _i13.PageRouteInfo<void> {
  const FeedView() : super(FeedView.name, path: '/feed-view');

  static const String name = 'FeedView';
}

/// generated route for
/// [_i9.ChallengesView]
class ChallengesView extends _i13.PageRouteInfo<void> {
  const ChallengesView() : super(ChallengesView.name, path: '/challenges-view');

  static const String name = 'ChallengesView';
}

/// generated route for
/// [_i10.ChallengeDetailView]
class ChallengeDetailView extends _i13.PageRouteInfo<void> {
  const ChallengeDetailView()
      : super(ChallengeDetailView.name, path: '/challenge-detail-view');

  static const String name = 'ChallengeDetailView';
}

/// generated route for
/// [_i11.VerifyEmailView]
class VerifyEmailView extends _i13.PageRouteInfo<void> {
  const VerifyEmailView()
      : super(VerifyEmailView.name, path: '/verify-email-view');

  static const String name = 'VerifyEmailView';
}

/// generated route for
/// [_i12.TestView]
class TestView extends _i13.PageRouteInfo<void> {
  const TestView() : super(TestView.name, path: '/test-view');

  static const String name = 'TestView';
}
