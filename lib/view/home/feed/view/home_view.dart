import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:learn_language/core/constants/image/image_constants.dart';
import 'package:learn_language/core/extensions/context_extension.dart';

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
            buildSliverAppBar(context, innerBoxIsScrolled),
          ],
          body: Body(viewModel: viewModel),
        ),
        bottomNavigationBar: const CustomBottomNavBar(),
      ),
    );
  }

  SliverAppBar buildSliverAppBar(
      BuildContext context, bool innerBoxIsScrolled) {
    return SliverAppBar(
      leading: const Icon(Icons.menu),
      title: Image.asset(
        ImageConstants.instance.splashImage,
        height: 50,
        fit: BoxFit.contain,
      ),
      centerTitle: true,
      floating: true,
      snap: true,
      pinned: true,
      forceElevated: innerBoxIsScrolled,
    );
  }
}
