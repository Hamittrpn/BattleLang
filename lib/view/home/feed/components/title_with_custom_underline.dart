import 'package:flutter/material.dart';

import '../../../../core/components/text/locale_text.dart';
import '../../../../core/extensions/context_extension.dart';

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: context.normalValue / 4),
            child: LocaleText(
              text: text,
              style: context.textTheme.headline6!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: context.normalValue / 4),
              height: 4,
              color: context.colors.secondary.withOpacity(0.4),
            ),
          )
        ],
      ),
    );
  }
}
