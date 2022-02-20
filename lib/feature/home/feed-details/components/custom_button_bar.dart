import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';

class CustomButtonBar extends StatelessWidget {
  const CustomButtonBar({
    Key? key,
    required this.primaryName,
    required this.secondaryName,
    required this.primaryPress,
    required this.secondaryPress,
  }) : super(key: key);

  final String primaryName, secondaryName;
  final Function() primaryPress, secondaryPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: context.screenWidth / 2,
          height: 84,
          child: TextButton(
            style: TextButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                  ),
                ),
                backgroundColor: context.colors.secondary),
            child: Text(
              primaryName,
              style: context.textTheme.headline6!
                  .copyWith(color: context.colors.primary),
            ),
            onPressed: primaryPress,
          ),
        ),
        Expanded(
          child: TextButton(
            child: Text(secondaryName),
            onPressed: secondaryPress,
          ),
        ),
      ],
    );
  }
}
