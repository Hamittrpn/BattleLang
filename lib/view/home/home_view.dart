import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/base/view/base_view.dart';
import '../../core/constants/image/image_constants.dart';
import '../../core/extensions/context_extension.dart';
import 'feed/viewmodel/feed_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<FeedViewModel>(
      viewModel: FeedViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, viewModel) => Container(
        color: context.colors.primary,
        child: SafeArea(
          top: false,
          child: ClipRRect(
            child: Scaffold(
              extendBody: true,
              body: Observer(builder: (_) {
                return NestedScrollView(
                  floatHeaderSlivers: true,
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    buildSliverAppBar(context, innerBoxIsScrolled),
                  ],
                  body: viewModel.screens[viewModel.navbarIndex],
                );
              }),
              bottomNavigationBar: Theme(
                data: Theme.of(context).copyWith(
                    iconTheme: IconThemeData(color: context.colors.surface)),
                child: CurvedNavigationBar(
                  buttonBackgroundColor: context.colors.secondaryVariant,
                  backgroundColor: Colors.transparent,
                  color: context.colors.primary,
                  height: 60,
                  animationCurve: Curves.easeInOut,
                  animationDuration: context.lowDuration,
                  index: viewModel.navbarIndex,
                  items: viewModel.navbarItems,
                  onTap: (index) => viewModel.navbarIndex = index,
                ),
              ),
            ),
          ),
        ),
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
