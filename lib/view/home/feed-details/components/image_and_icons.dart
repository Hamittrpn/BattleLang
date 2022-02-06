import 'package:flutter/material.dart';

import '../../../../core/constants/image/image_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import 'icon_card.dart';

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.normalValue),
      child: SizedBox(
        height: context.screenHeight * 0.8,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: context.mediumValue * 2),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        padding: context.paddingAllDefaultScreen,
                        icon: Icon(
                          Icons.arrow_back,
                          color: context.colors.onSurface,
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconCard(icon: ImageConstants.instance.challengeInfo),
                    IconCard(icon: ImageConstants.instance.friends),
                    IconCard(icon: ImageConstants.instance.points),
                    IconCard(icon: ImageConstants.instance.challengeInfo),
                  ],
                ),
              ),
            ),
            Container(
              height: context.screenHeight * 0.8,
              width: context.screenWidth * 0.75,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(63),
                  bottomLeft: Radius.circular(63),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 60,
                    color: context.colors.primary.withOpacity(0.29),
                  )
                ],
                image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.cover,
                    image:
                        AssetImage(ImageConstants.instance.challengeBanner1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
