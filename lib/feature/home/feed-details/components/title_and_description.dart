import 'package:flutter/material.dart';
import '../../../../core/extensions/context_extension.dart';

class TitleAndDescription extends StatelessWidget {
  const TitleAndDescription({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingHorizontalDefaultScreen,
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$title\n",
                  style: context.textTheme.headline4!.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: description,
                  style: context.textTheme.bodyText1!.copyWith(
                      color: context.colors.surface,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
