import 'package:auto_size_text/auto_size_text.dart';
// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

import '../../extensions/string_extension.dart';

class LocaleText extends StatelessWidget {
  const LocaleText({Key? key, required this.text, this.style, this.textAlign})
      : super(key: key);
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text.locale.tr(),
      textAlign: textAlign,
      style: style,
    );
  }
}
