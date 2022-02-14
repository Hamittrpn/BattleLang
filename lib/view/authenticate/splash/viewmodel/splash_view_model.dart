import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../service/local_notification_service.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    _firebaseInit();
    controlAppState();
  }

  Future<void> controlAppState() async {
    context!.router.pushNamed(NavigationConstants.ON_BOARDING_VIEW);
  }

  Future<void> _firebaseInit() async {
    await Firebase.initializeApp();
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    FirebaseMessaging.onBackgroundMessage(backgroundHandler);

    LocalNotificationService.initialize();

    await firebaseMessaging.requestPermission();
    final token = await firebaseMessaging.getToken();
    if (kDebugMode) {
      print(token);
    }

    //Gives you the message on wich user taps
    //and it opened the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data["routePage"];
        if (kDebugMode) {
          print(routeFromMessage);
        }
        context!.router.pushNamed(routeFromMessage);
      }
    });

    //foreground work
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        if (kDebugMode) {
          print(message.notification!.body);
        }
        if (kDebugMode) {
          print(message.notification!.title);
        }
      }
      LocalNotificationService.display(message);
    });

    // When the app is in background but opened and user taps
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["routePage"];
      context!.router.pushNamed(routeFromMessage);
    });
  }

  Future<void> backgroundHandler(RemoteMessage message) async {
    if (kDebugMode) {
      print(message.data.toString());
    }
    if (kDebugMode) {
      print(message.notification!.title);
    }
  }
}
