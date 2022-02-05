import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../components/body.dart';
import '../viewmodel/feed_view_model.dart';

class FeedView extends StatelessWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<FeedViewModel>(
      viewModel: FeedViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, viewModel) =>
          Body(viewModel: viewModel),
    );
  }
}
