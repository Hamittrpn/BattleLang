import 'package:flutter/material.dart';
import 'package:learn_language/core/constants/image/image_constants.dart';
import 'package:learn_language/core/extensions/context_extension.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Column(
              children: [
                Container(
                  height: context.screenHeight * 0.8,
                  width: context.screenWidth * 75,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(63),
                      bottomLeft: Radius.circular(63),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: 60,
                        color: context.colors.primary,
                      )
                    ],
                    image: DecorationImage(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.cover,
                        image: AssetImage(
                            ImageConstants.instance.challengeBanner2)),
                  ),
                )
              ],
            ))
          ],
        )
      ],
    );
  }
}
