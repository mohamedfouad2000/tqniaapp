import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/Notification/notification_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/noti_screen.dart';
import 'package:tqniaapp/Feature/login/presentation/views/login_view.dart';
import 'package:tqniaapp/main.dart';

class NotificationSound {
  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage? message) async {
    if (message == null) return;

    print("backGround");
    print(message.data.toString());
    Fluttertoast.showToast(
        msg: message.notification!.body.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 18.0);

    //  NavegatorPush(context, const NotificationScreen());
  }

  static Future<void> onMessageOpenedApp(RemoteMessage event) async {
    navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (builder) => const NotificationScreen()),
    );
    print("on messageopen");
    print(event.data.toString());
    print(event.notification?.title);
  }

  static Future<void> onMessage(RemoteMessage event) async {
    print("on onMessage");
    print(event.data.toString());
    print(event.notification?.title);
    Fluttertoast.showToast(
        msg: event.notification!.body.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 18.0);
  }
}
