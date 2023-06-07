import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:isar/isar.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:taskgo/database/main_repository.dart';
import 'package:taskgo/features/add_task/add_task.dart';
import 'package:taskgo/util/constants.dart';
import 'package:taskgo/util/notification_util.dart';

import 'all_tasks_repository.dart';

class AllTasksProvider extends ChangeNotifier {
  ///Add the search bar in all tasks page
  ///Change all tasks in dashboard to today's task
  ///Create tabs for all dashboard items
  ///Add listeners & watchers
  ///on tap dashboard items change tabs
  ///
  ///
  //Add task repository for all DB operations
  final AllTasksRepository _repository = AllTasksRepository();

  //A listener to watch the tasks collection
  //this method is called in initState of homeScreen
  //It updates all the consumer of all tasks provider whenever
  //any operation happens on the tasks collection
  void initAllTasksProvider() {
    //Creates a stream
    Stream<void> taskChanged = isarDb.tasks.watchLazy();
    //listens to the all tasks stream
    taskChanged.listen((_) {
      //notify all the listeners of allTasksProvider to update the UI
      notifyListeners();
    });
  }

  //Creates a stream generator for the tasks list
  //Fires Immediately whenever the task list is updated
  Stream<List<Task>> listenTaskList() async* {
    yield* isarDb.tasks
        .where()
        //Sort the list by isCompleted
        //Which goes at the bottom as already completed
        .sortByIsCompleted()
        //Then by has due date
        //No deadline tasks are at the bottom, above completed
        .thenByHasDueDateDesc()
        //then all the overDueTask on the top in descending order
        .thenByIsOverDueDesc()
        .thenByDueDateTime()
        .watch(fireImmediately: true);
  }

  //Return the total tasks count that are due today
  int getTodaysTasksCount() {
    return isarDb.tasks.filter().isTodaysTaskEqualTo(true).countSync();
  }

  //Return the all tasks count
  int getUpcomingTasksCount() {
    return isarDb.tasks
        .filter()
        //Check if the overDue value is true
        .isUpcomingTaskEqualTo(true)
        .countSync();
  }

  //Return the all tasks count which is overdue
  int getOverDueTasksCount() {
    return isarDb.tasks
        .filter()
        //Check if the overDue value is true
        .isOverDueEqualTo(true)
        //Return the count
        .countSync();
  }

  //Return the all tasks count which is overdue
  int getCompletedTasksCount() {
    return isarDb.tasks.filter().isDoneEqualTo(true).countSync();
  }

  Future updateTaskStatus(Task task, BuildContext context) async {
    //Save the context value before calling any async method
    //As context can become null, in between async calls
    var overlayLoader = context.loaderOverlay;

    //Show a loader
    overlayLoader.show();

    //task updated On
    task.updatedOn = DateTime.now();

    //Cancel scheduled notification if any when task is done
    if (task.isDone) {
      NotificationUtil.cancelscheduledNotification(task.id!);
    }

    //complete the task
    await _repository.updateTaskStatus(task);
    //hide the loader
    overlayLoader.hide();

    //show success alert
    AlertController.show(
      "Success!",
      "Task updated successfully",
      TypeAlert.success,
    );
  }

  //Creates a stream generator for today's task List
  //Fires Immediately whenever the task list is updated
  Stream<List<Task>> listenTodayTaskList() async* {
    yield* isarDb.tasks
        .filter()
        .isTodaysTaskEqualTo(true)
        .watch(fireImmediately: true);
  }

  //Creates a stream generator for overdue task list
  //Fires Immediately whenever the task list is updated
  Stream<List<Task>> overDueTaskList() async* {
    yield* isarDb.tasks
        .filter()
        //Check if the overDue value is true
        .isOverDueEqualTo(true)
        .watch(fireImmediately: true);
  }

  //Creates a stream generator for upcoming tasks list
  //Fires Immediately whenever the task list is updated
  Stream<List<Task>> upcomingTaskList() async* {
    yield* isarDb.tasks
        .filter()
        //Check if upcoming is equal to true
        .isUpcomingTaskEqualTo(true)
        .watch(fireImmediately: true);
  }

  //This will return the tasks count of different tasks
  int getTaskCountFromKey(String key) {
    switch (key) {
      //Return count of all tasks
      case Constants.upcomingTasks:
        return getUpcomingTasksCount();
      //Return count of completed tasks
      case Constants.completedTasks:
        return getCompletedTasksCount();
      //Return count of Overdue tasks
      case Constants.overdueTasks:
        return getOverDueTasksCount();
      //Return count of today's tasks
      case Constants.todayTasks:
        return getTodaysTasksCount();

      //If no case matched return 0
      default:
        return 0;
    }
  }

//This will return the tasks stream of different tasks
  Stream<List<Task>>? getTaskStreamFromKey(String key) {
    switch (key) {
      //Return count of completed tasks
      case Constants.upcomingTasks:
        return upcomingTaskList();
      //Return count of Overdue tasks
      case Constants.overdueTasks:
        return overDueTaskList();
      //Return count of today's tasks
      case Constants.todayTasks:
        return listenTodayTaskList();

      //If no case matched return 0
      default:
        return null;
    }
  }
}
