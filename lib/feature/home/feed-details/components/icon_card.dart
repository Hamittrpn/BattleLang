import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';

class IconCard extends StatelessWidget {
  const IconCard({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.paddingVerticalDefaultScreen * 1.3,
      padding: context.paddingAllDefaultScreen * 0.50,
      height: 62,
      width: 62,
      decoration: BoxDecoration(
        color: context.colors.secondary,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 20),
            blurRadius: 22,
            color: context.colors.onSurface.withOpacity(0.44),
          ),
          BoxShadow(
              offset: const Offset(-15, -15),
              blurRadius: 20,
              color: context.colors.onBackground),
        ],
      ),
      child: Image.asset(icon),
    );
  }
}
