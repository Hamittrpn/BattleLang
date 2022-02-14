// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import '../../../core/components/icon_widget.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/utils/utils.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);
  static const keyLanguage = 'key-language';

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
        title: LocaleKeys.settings_account_settings.tr(),
        subtitle: LocaleKeys.settings_privacy.tr() +
            ', ' +
            LocaleKeys.settings_security.tr() +
            ', ' +
            LocaleKeys.settings_language.tr() +
            ', ',
        leading: IconWidget(
          icon: Icons.person,
          color: context.colors.secondary,
        ),
        child: SettingsScreen(
          children: [
            buildChangeLanguage(context),
            buildPrivacy(context),
            buildSecurity(context),
            buildAccountInfo(context),
          ],
        ),
      );

  buildChangeLanguage(BuildContext context) => DropDownSettingsTile(
        title: LocaleKeys.settings_language.tr(),
        settingKey: keyLanguage,
        selected: 1,
        values: const <int, String>{1: 'English', 2: 'Turkish'},
        onChange: (language) {},
      );
}

Widget buildPrivacy(BuildContext context) => SimpleSettingsTile(
      title: LocaleKeys.settings_privacy.tr(),
      subtitle: '',
      leading: IconWidget(
        icon: Icons.privacy_tip,
        color: context.colors.secondary,
      ),
      onTap: () => Utils.showSnackBar("Tapped Privacy"),
    );

Widget buildSecurity(BuildContext context) => SimpleSettingsTile(
      title: LocaleKeys.settings_security.tr(),
      subtitle: '',
      leading: IconWidget(
        icon: Icons.security,
        color: context.colors.secondary,
      ),
      onTap: () => Utils.showSnackBar("Tapped Security"),
    );

Widget buildAccountInfo(BuildContext context) => SimpleSettingsTile(
      title: LocaleKeys.settings_account_settings.tr(),
      subtitle: '',
      leading: IconWidget(
        icon: Icons.text_snippet,
        color: context.colors.secondary,
      ),
      onTap: () => Utils.showSnackBar("Tapped Account Info "),
    );
