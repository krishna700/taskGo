import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../features/add_task/add_task.dart';

// ignore: depend_on_referenced_packages
import 'package:timezone/timezone.dart';

//Primary notification channel key
const String primaryChannelKey = 'task_go_basic_channel';

class NotificationUtil {
  static FlutterLocalNotificationsPlugin localNotifications =
      FlutterLocalNotificationsPlugin();
  //init the awesome notification plugin
  static void initNotification() async {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('ic_launcher');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await localNotifications.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});

    //request permission
    requestNotificationPermission();
  }

  static void requestNotificationPermission() {
    localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
          primaryChannelKey,
          'task_go_Channel',
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails());
  }

  //Cancels a scheduled notification of a task
  //If user already completes the task
  //Or turns of the reminder for the task
  static cancelscheduledNotification(id) async {
    await localNotifications.cancel(id);
  }

  //Schedules a notification for a task
  static Future<void> scheduleNewNotification({
    required Task task,
  }) async {
    await localNotifications.zonedSchedule(
      //Task id used as notification id
      //we can use this id to cancel the reminder
      task.id!,
      //notification content
      "Reminder for ${task.taskName}",
      task.description,
      //Subtract 30 secs from the due dateTime as
      //we will notify before 30 secs
      TZDateTime.from(
        task.dueDateTime!.subtract(const Duration(seconds: 30)),
        local,
      ),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          primaryChannelKey,
          'task_go_Channel',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }
}
