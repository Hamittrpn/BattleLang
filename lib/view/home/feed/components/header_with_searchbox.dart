import 'package:flutter/material.dart';

import '../../../../core/components/text/locale_text.dart';
import '../../../../core/constants/image/image_constants.dart';
import '../../../../core/extensions/context_extension.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.mediumValue * 1.0),
      height: context.screenHeight * 0.2,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: context.normalValue,
                right: context.normalValue,
                bottom: context.normalValue + 36),
            height: context.screenHeight * 0.2 - 27,
            decoration: BoxDecoration(
              color: context.colors.primary,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36)),
            ),
            child: Row(
              children: [
                LocaleText(
                  text: "Hi Ece",
                  style: context.textTheme.headline4!.copyWith(
                    color: context.colors.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                CircleAvatar(
                  radius: 32,
                  backgroundColor: context.colors.secondary,
                  backgroundImage: AssetImage(
                    ImageConstants.instance.user3,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: context.paddingHorizontalDefaultScreen,
              padding: context.paddingHorizontalDefaultScreen,
              height: 54,
              decoration: BoxDecoration(
                color: context.colors.onBackground,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: context.colors.primary.withOpacity(0.23),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: context.colors.primary.withOpacity(0.5),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.search,
                    color: context.colors.primary,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
