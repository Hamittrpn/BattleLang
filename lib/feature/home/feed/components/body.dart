import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../viewmodel/feed_view_model.dart';
import 'header_with_searchbox.dart';
import 'last_challenges.dart';
import 'title_with_more_button.dart';
import 'your_friends.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.viewModel}) : super(key: key);

  final FeedViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(bottom: context.mediumValue),
        child: Column(
          children: [
            const HeaderWithSearchBox(),
            TitleWithMoreButton(
              title: "Last Challenges",
              press: () {},
            ),
            LastChallenges(
              viewModel: viewModel,
            ),
            TitleWithMoreButton(
              title: "Your Friends",
              press: () {},
            ),
            const YourFriends(),
            SizedBox(height: context.normalValue),
          ],
        ),
      ),
    );
  }
}
