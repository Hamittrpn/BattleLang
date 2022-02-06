import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/image/image_constants.dart';
import '../../../../core/extensions/context_extension.dart';
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
      onPageBuilder: (BuildContext context, viewModel) => Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            buildSliverAppBar(context, viewModel),
          ],
          body: Body(viewModel: viewModel),
        ),
      ),
    );
  }

  SliverAppBar buildSliverAppBar(
      BuildContext context, FeedViewModel viewModel) {
    return SliverAppBar(
      backgroundColor: context.colors.primary,
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications,
            color: context.colors.secondary,
          ),
          onPressed: () {},
        ),
      ],
      title: Image.asset(
        ImageConstants.instance.splashImage,
        height: 50,
        fit: BoxFit.contain,
      ),
      centerTitle: true,
      floating: true,
      snap: true,
      pinned: true,
      forceElevated: false,
    );
  }
}
