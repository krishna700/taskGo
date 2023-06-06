import 'package:flutter/material.dart';
import 'package:taskgo/config/app_theme.dart';

class Constants {
  //Task priority constant
  static const int taskHighPriority = 3;
  static const int taskMediumPriority = 2;
  static const int taskLowPriority = 1;

  //Different priorities of a task
  static List<String> taskPriorities = ["Low", "Medium", "High"];
  //Different priority color of a task
  static List<Color> taskPrioritiesColor = [
    Colors.green,
    Colors.yellow,
    Colors.red
  ];

  //Date formatters
  static const String monthDayYear = 'MMM dd, yyyy';
  static const String deadline = 'h:mma, MMM dd, yyyy';

  //Task dashboard grid categories & their color gradients
  static const Map<String, LinearGradient> taskDashboardItems = {
    "All tasks": AppTheme.darkBlueGradient,
    "Current Month tasks": AppTheme.darkOrangeGradient,
    "Overdue tasks": AppTheme.redGradient,
    "Completed Tasks": AppTheme.greenGradient,
  };
}
