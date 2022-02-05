import 'package:flutter/material.dart';

import '../../../../core/constants/image/image_constants.dart';
import '../../../../core/extensions/context_extension.dart';

class YourFriends extends StatelessWidget {
  const YourFriends({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          YourFriendsCard(
            image: ImageConstants.instance.user3,
            press: () {},
          ),
          YourFriendsCard(
            image: ImageConstants.instance.user2,
            press: () {},
          ),
          YourFriendsCard(
            image: ImageConstants.instance.user1,
            press: () {},
          ),
          YourFriendsCard(
            image: ImageConstants.instance.user3,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class YourFriendsCard extends StatelessWidget {
  const YourFriendsCard({
    Key? key,
    required this.image,
    required this.press,
  }) : super(key: key);

  final String image;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
            left: context.mediumValue,
            top: context.mediumValue / 2,
            bottom: context.mediumValue / 2),
        width: context.screenWidth * 0.33,
        height: context.screenHeight * 0.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(image),
            )),
      ),
    );
  }
}
