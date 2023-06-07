// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:taskgo/task_go_app.dart';
import 'package:taskgo/util/notification_util.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'database/main_repository.dart';

void main() {
  /// Prefer to Use runZonedGuarded over simple run.
  /// This will help to catch any uncaught exceptions.
  /// And pass it on to Crashlytics or any crash reporting tool.

  runZonedGuarded<Future<void>>(() async {
    //Ensures the widget is initialized before calling any other methods
    WidgetsFlutterBinding.ensureInitialized();
    //init local notifications
    NotificationUtil.initNotification();
    tz.initializeTimeZones();
    //init isar DB for storing tasks
    initDB();
    //Run the TaskGoApp
    runApp(
      const TaskGoApp(),
    );
  }, ((error, stack) {
    ///Pass the exception & stack trace here.
  }));
}
