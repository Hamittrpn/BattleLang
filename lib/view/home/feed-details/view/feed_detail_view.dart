import 'package:flutter/material.dart';
import '../../../../core/base/view/base_view.dart';
import '../components/body.dart';
import '../viewmodel/feed_detail_viewmodel.dart';

class ChallengeDetailView extends StatelessWidget {
  const ChallengeDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<FeedDetailViewModel>(
      viewModel: FeedDetailViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, FeedDetailViewModel value) =>
          Scaffold(
        body: Body(),
      ),
    );
  }
}
