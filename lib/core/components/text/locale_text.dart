import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

import '../../extensions/string_extension.dart';

class LocaleText extends StatelessWidget {
  const LocaleText({Key? key, required this.text, this.style})
      : super(key: key);
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text.locale.tr(),
      style: style,
    );
  }
}
