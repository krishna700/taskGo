import 'package:flutter/material.dart';
import 'package:taskgo/features/home/home_screen.dart';
import 'package:taskgo/splash_screen.dart';

import '../features/add_task/add_task.dart';

/// Named Routes

const String splashRoute = '/splash';
const String homeRoute = '/home';
const String addTaskRoute = '/add_task';

class RouteGenerator {
  /// Dynamicly generate routes to navigate through named routes.
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      ///Initial route
      case splashRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      ///Home Screen
      case homeRoute:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      ///Add task Screen
      case addTaskRoute:
        return MaterialPageRoute(
          builder: (context) => const AddTaskScreen(),
        );
    }
    return _generateErrorRoute();
  }

  ///Returns an error widget when a null route is encountered
  ///In general [generateRoute] shouldn't return null

  static Route<dynamic> _generateErrorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('error'),
        ),
        body: const Center(
          child: Text('error'),
        ),
      );
    });
  }
}
