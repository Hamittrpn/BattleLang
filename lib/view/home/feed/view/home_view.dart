import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/custom_bottom_navbar.dart';
import '../component/body.dart';
import '../viewmodel/feed_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

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
            buildSliverAppBar(innerBoxIsScrolled),
          ],
          body: Body(viewModel: viewModel),
        ),
        bottomNavigationBar: const CustomBottomNavBar(),
      ),
    );
  }

  SliverAppBar buildSliverAppBar(bool innerBoxIsScrolled) {
    return SliverAppBar(
      leading: const Icon(Icons.menu),
      floating: true,
      snap: false,
      pinned: true,
      forceElevated: innerBoxIsScrolled,
    );
  }
}
