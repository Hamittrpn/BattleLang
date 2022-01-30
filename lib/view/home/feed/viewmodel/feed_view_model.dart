import 'package:flutter/material.dart';
import 'package:learn_language/core/base/model/base_view_model.dart';
import 'package:learn_language/core/constants/navigation/navigation_constants.dart';

import 'package:mobx/mobx.dart';
part 'feed_view_model.g.dart';

class FeedViewModel = _FeedViewModelBase with _$FeedViewModel;

abstract class _FeedViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}

  void goToDetailView() {
    navigation.navigateToPage(NavigationConstants.CHALLENGE_DETAIL_VIEW, null);
  }
}
