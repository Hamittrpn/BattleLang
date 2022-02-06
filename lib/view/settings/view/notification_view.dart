import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:learn_language/core/components/icon_widget.dart';
import 'package:learn_language/core/extensions/context_extension.dart';
import 'package:learn_language/core/init/lang/locale_keys.g.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);
  static const keyNews = 'key-news';
  static const keyActivity = 'key-Activity';
  static const keyNewsletter = 'key-Newsletter';
  static const keyAppUpdates = 'key-AppUpdates';

  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
      title: LocaleKeys.settings_notifications.tr(),
      subtitle: LocaleKeys.settings_newsletter.tr() +
          ', ' +
          LocaleKeys.settings_app_updates.tr(),
      leading: IconWidget(
        icon: Icons.notifications,
        color: context.colors.secondary,
      ),
      child: SettingsScreen(
        title: LocaleKeys.settings_notifications.tr(),
        children: <Widget>[
          buildNews(context),
          buildActivity(context),
          buildNewsletter(context),
          buildAppUpdates(context),
        ],
      ),
    );
  }

  Widget buildNews(BuildContext context) => SwitchSettingsTile(
        title: LocaleKeys.settings_news_for_you.tr(),
        settingKey: keyNews,
        leading:
            IconWidget(icon: Icons.message, color: context.colors.secondary),
      );

  Widget buildActivity(BuildContext context) => SwitchSettingsTile(
        title: LocaleKeys.settings_account_activity.tr(),
        settingKey: 'key-Activity',
        leading: IconWidget(
            icon: Icons.text_snippet, color: context.colors.secondary),
      );

  Widget buildNewsletter(BuildContext context) => SwitchSettingsTile(
        title: LocaleKeys.settings_newsletter.tr(),
        settingKey: 'key-Newsletter',
        leading: IconWidget(
            icon: Icons.create_new_folder_sharp,
            color: context.colors.secondary),
      );

  Widget buildAppUpdates(BuildContext context) => SwitchSettingsTile(
        title: LocaleKeys.settings_app_updates.tr(),
        settingKey: 'key-AppUpdates',
        leading:
            IconWidget(icon: Icons.timelapse, color: context.colors.secondary),
      );
}
