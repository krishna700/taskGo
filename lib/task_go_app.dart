
import 'package:flutter/material.dart';
import 'package:taskgo/config/config.dart';

/// [TaskGoApp] is the root of the application.
/// This Widget gives an entry point of our application.
/// After the flutter engine starts the MaterialApp is pushed,
/// then either initial route or home widget is pushed.
class TaskGoApp extends StatelessWidget {
  const TaskGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskGo',
      theme: AppTheme.getLightTheme(),
      themeMode: ThemeMode.light,
      //Specifies the initial route of the app
      //This route/widget is first pushed in the stack when the app starts
      initialRoute: splashRoute,
      //Dynamic route generator of the app
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
