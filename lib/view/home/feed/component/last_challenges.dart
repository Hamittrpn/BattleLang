import 'package:flutter/material.dart';
import 'package:learn_language/view/home/feed/viewmodel/feed_view_model.dart';

import '../../../../core/constants/image/image_constants.dart';
import '../../../../core/extensions/context_extension.dart';

class LastChallenges extends StatelessWidget {
  const LastChallenges({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final FeedViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          LastChallengesCard(
            image: ImageConstants.instance.challengeBanner1,
            categoryName: "Race Together",
            points: "24",
            press: viewModel.goToDetailView,
          ),
          LastChallengesCard(
            image: ImageConstants.instance.challengeBanner2,
            categoryName: "Find the Words",
            points: "12",
            press: viewModel.goToDetailView,
          ),
          LastChallengesCard(
            image: ImageConstants.instance.challengeBanner3,
            categoryName: "time attack",
            points: "50",
            press: viewModel.goToDetailView,
          ),
          LastChallengesCard(
            image: ImageConstants.instance.challengeBanner4,
            categoryName: "Sentences Powe",
            points: "45",
            press: viewModel.goToDetailView,
          ),
          LastChallengesCard(
            image: ImageConstants.instance.challengeBanner6,
            categoryName: "Write a story",
            points: "39",
            press: viewModel.goToDetailView,
          ),
          LastChallengesCard(
            image: ImageConstants.instance.challengeBanner2,
            categoryName: "time attack",
            points: "19",
            press: viewModel.goToDetailView,
          ),
        ],
      ),
    );
  }
}

class LastChallengesCard extends StatelessWidget {
  const LastChallengesCard({
    Key? key,
    required this.categoryName,
    required this.points,
    required this.press,
    required this.image,
  }) : super(key: key);

  final String image, categoryName, points;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * 0.4,
      margin: EdgeInsets.only(
        left: context.normalValue,
        top: context.normalValue / 2,
        bottom: context.normalValue * 2.5,
      ),
      child: Column(
        children: [
          SizedBox(
            height: context.screenHeight * 0.23,
            width: double.infinity,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: context.paddingAllDefaultScreen / 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 0),
                    blurRadius: 50,
                    color: context.colors.primary.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$categoryName\n",
                          style: context.textTheme.bodyText1,
                        ),
                        TextSpan(
                          text: "$points ".toUpperCase(),
                          style: context.textTheme.bodyText1!.copyWith(
                              color: context.colors.secondary.withOpacity(0.8)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
