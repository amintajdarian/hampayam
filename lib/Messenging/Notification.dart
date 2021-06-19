import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MessageNotifcation {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings;
  IOSInitializationSettings iosInitializationSettings;
  InitializationSettings initializationSettings;
  void initializing() async {
    androidInitializationSettings = AndroidInitializationSettings('icon');
    iosInitializationSettings = IOSInitializationSettings(onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initializationSettings = new InitializationSettings(android: androidInitializationSettings, iOS: iosInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: onSelectNotification);
  }

  void showNotifications(String senderName, String message) async {
    await notification(senderName, message);
  }

  Future<void> notification(String senderName, String message) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('Channel ID', 'Channel title', 'channel body', priority: Priority.high, importance: Importance.max, ticker: 'test');

    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails, iOS: iosNotificationDetails);
    await flutterLocalNotificationsPlugin.show(0, '$senderName', '$message', notificationDetails, payload: 'payload');
  }

  Future onSelectNotification(String payLoad) {
    if (payLoad != null) {
      print('a');
    }
  }

  Future onDidReceiveLocalNotification(int id, String title, String body, String payload) async {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(body),
      actions: <Widget>[
        CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              print("");
            },
            child: Text("Okay")),
      ],
    );
  }
}
