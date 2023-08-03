import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseNotificationPush {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final _localNotifications = FlutterLocalNotificationsPlugin();


  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    print('Title: ${message.notification?.title}');
    print('Body: ${message.notification?.body}');
    print('Payload: ${message.data}');
  }

  final _androidChannel = const AndroidNotificationChannel(
      'com.htnguyen.nike.nike', 'Nike Notifications',
      description: 'This channdel is used for', importance: Importance.max);

  Future<void> initNotifications() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      sound: true,
    );
    final fCMToken = await _firebaseMessaging.getToken();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User grandted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
    print('Token: $fCMToken');

    initNotifications();
    initLocalNotifications();
  }



  Future initLocalNotifications() async {
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const settings = InitializationSettings(android: android);

    await _localNotifications.initialize(
      settings,
    );

    final platform = _localNotifications.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .getInitialMessage()
        .then(handleMess);
    FirebaseMessaging.onMessageOpenedApp.listen(handleBackgroundMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;

      if (notification == null) return;

      _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              _androidChannel.id,
              _androidChannel.name,
              channelDescription: _androidChannel.description,
            ),
          ),
          payload: jsonEncode(message.toMap()));
    });
  }
}
