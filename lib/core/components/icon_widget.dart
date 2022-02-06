import 'package:flutter/material.dart';
import 'package:learn_language/core/extensions/context_extension.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({Key? key, required this.icon, required this.color})
      : super(key: key);

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        padding: context.paddingAllDefaultScreen / 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Icon(
          icon,
          color: context.colors.primary,
        ),
      );
}
