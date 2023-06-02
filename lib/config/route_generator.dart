import 'package:flutter/material.dart';

/// Named Routes

const String splashRoute = '/splash';
const String home = '/home';

class RouteGenerator {
  /// Dynamicly generate routes to navigate through named routes.
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      ///Initial route
      case splashRoute:
      // return MaterialPageRoute(builder: (context) => PlainScreen());
      ///Home Screen
      case home:
    }
    return _generateErrorRoute();
  }

  ///Returns a widget when a null route is encountered
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
