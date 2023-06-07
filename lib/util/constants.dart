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
  static const String deadline = 'MMM dd, yyyy, h:mma';

  //Task dashboard items key
  static const todayTasks = "Today's Tasks";
  static const allTasks = "All Tasks";
  static const overdueTasks = "Overdue Tasks";
  static const completedTasks = "Completed Tasks";
  static const upcomingTasks = "Upcoming Tasks";

  //Task dashboard grid categories & their color gradients
  static const Map<String, LinearGradient> taskDashboardItems = {
    todayTasks: AppTheme.darkOrangeGradient,
    upcomingTasks: AppTheme.darkBlueGradient,
    overdueTasks: AppTheme.redGradient,
    completedTasks: AppTheme.greenGradient,
  };

  static const List<String> taskBoardTaskLists = [
    todayTasks,
    overdueTasks,
    upcomingTasks,
  ];
}
