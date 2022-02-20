import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';

part 'feed_detail_viewmodel.g.dart';

class FeedDetailViewModel = _FeedDetailViewModelBase with _$FeedDetailViewModel;

abstract class _FeedDetailViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}
}
