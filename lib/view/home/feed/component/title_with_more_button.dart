import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import 'title_with_custom_underline.dart';

class TitleWithMoreButton extends StatelessWidget {
  const TitleWithMoreButton({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingHorizontalDefaultScreen,
      child: Row(
        children: [
          TitleWithCustomUnderline(text: title),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(68, 28),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: Text(
              "more",
              style: context.textTheme.bodyText2!.copyWith(
                color: Colors.white,
              ),
            ),
            onPressed: press,
          )
        ],
      ),
    );
  }
}
