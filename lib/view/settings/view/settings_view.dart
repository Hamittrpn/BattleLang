// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:provider/provider.dart';

import '../../../core/components/icon_widget.dart';
import '../../../core/constants/enum/app_theme_enum.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/notifier/theme_notifier.dart';
import '../../../core/utils/utils.dart';
import 'account_view.dart';
import 'notification_view.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);
  static const keyDarkMode = 'key-dark-mode';

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  IconData modeIcon = Icons.dark_mode;
  String darkModeTitle = LocaleKeys.settings_dark_mode.tr();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.onBackground,
      body: Column(
        children: [
          buildDarkMode(context),
          buildGeneralGroup(context),
          const SizedBox(height: 32),
          buildFeedbackGroup(context),
        ],
      ),
    );
  }

  SettingsGroup buildGeneralGroup(BuildContext context) {
    return SettingsGroup(
      title: LocaleKeys.settings_general.tr(),
      children: <Widget>[
        const AccountView(),
        const NotificationView(),
        buildLogOut(context),
      ],
    );
  }

  SettingsGroup buildFeedbackGroup(BuildContext context) {
    return SettingsGroup(
      title: LocaleKeys.settings_feedback.tr(),
      children: <Widget>[
        buildReportBug(context),
        buildSendFeedback(context),
      ],
    );
  }

  Widget buildLogOut(BuildContext context) => SimpleSettingsTile(
        title: LocaleKeys.auth_login_log_out.tr(),
        subtitle: '',
        leading: IconWidget(
          icon: Icons.logout,
          color: context.colors.secondary,
        ),
        onTap: () {
          Settings.clearCache();
          Utils.showSnackBar("Tapped Logout");
        },
      );

  Widget buildReportBug(BuildContext context) => SimpleSettingsTile(
        title: LocaleKeys.settings_bug.tr(),
        subtitle: '',
        leading: IconWidget(
          icon: Icons.bug_report,
          color: context.colors.secondary,
        ),
        onTap: () => Utils.showSnackBar("Tapped Report A Bug"),
      );

  Widget buildSendFeedback(BuildContext context) => SimpleSettingsTile(
        title: LocaleKeys.settings_feedback.tr(),
        subtitle: '',
        leading: IconWidget(
          icon: Icons.thumb_up,
          color: context.colors.secondary,
        ),
        onTap: () => Utils.showSnackBar("Tapped Send Feedback "),
      );

  Widget buildDarkMode(BuildContext context) => SwitchSettingsTile(
        settingKey: SettingsView.keyDarkMode,
        title: darkModeTitle,
        subtitle: '',
        leading: IconWidget(
          icon: modeIcon,
          color: context.colors.secondary,
        ),
        onChange: (value) {
          _changeModeIconAndTitle(value);
        },
      );

  void _changeModeIconAndTitle(bool value) {
    if (value) {
      setState(() {
        modeIcon = Icons.dark_mode;
        darkModeTitle = LocaleKeys.settings_dark_mode.tr();
        _changeTheme(context, AppThemes.DARK);
      });
    } else {
      setState(() {
        modeIcon = Icons.light_mode;
        darkModeTitle = LocaleKeys.settings_light_mode.tr();
        _changeTheme(context, AppThemes.LIGHT);
      });
    }
  }

  Future<void> _changeTheme(BuildContext context, AppThemes mode) async {
    Provider.of<ThemeNotifier>(context, listen: false).changeValue(mode);
  }
}
