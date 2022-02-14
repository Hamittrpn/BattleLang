import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

import '../../core/init/navigation/router.gr.dart';
import '../../core/init/notifier/theme_notifier.dart';
import '../../core/utils/utils.dart';

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp.router(
        routerDelegate: AutoRouterDelegate(
          _appRouter,
          navigatorObservers: () => [RouteObserver()],
        ),
        routeInformationParser: _appRouter.defaultRouteParser(),
        scaffoldMessengerKey: Utils.messengerKey,
        debugShowCheckedModeBanner: false,
        locale: context.locale,
        theme: context.watch<ThemeNotifier>().currentTheme,
        localizationsDelegates: context.localizationDelegates,
      ),
    );
  }
}
