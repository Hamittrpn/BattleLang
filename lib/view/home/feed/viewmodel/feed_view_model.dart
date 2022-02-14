import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../settings/view/settings_view.dart';
import '../../challenge/view/challenges_view.dart';
import '../../test/view/test_view.dart';
import '../view/feed_view.dart';

part 'feed_view_model.g.dart';

class FeedViewModel = _FeedViewModelBase with _$FeedViewModel;

abstract class _FeedViewModelBase with Store, BaseViewModel {
  final navbarItems = <Widget>[
    const Icon(Icons.home),
    const Icon(Icons.favorite),
    const Icon(Icons.person),
    const Icon(Icons.settings),
  ];

  final screens = [
    const FeedView(),
    const ChallengesView(),
    const TestView(),
    const SettingsView(),
  ];

  @observable
  int navbarIndex = 0;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}

  void goToDetailView() {
    context!.router.pushNamed(NavigationConstants.CHALLENGE_DETAIL_VIEW);
  }
}
