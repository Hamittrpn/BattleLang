import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/base/view/base_view.dart';
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
        model.init();
      },
      onPageBuilder: (BuildContext context, viewModel) => Container(
        color: context.colors.primary,
        child: SafeArea(
          child: ClipRRect(
            child: Scaffold(
              extendBody: true,
              body: Observer(builder: (_) {
                return viewModel.screens[viewModel.navbarIndex];
              }),
              bottomNavigationBar: Theme(
                data: context.theme,
                child: CurvedNavigationBar(
                  buttonBackgroundColor: context.colors.secondary,
                  backgroundColor: Colors.transparent,
                  color: context.colors.primary,
                  height: 50,
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
}
