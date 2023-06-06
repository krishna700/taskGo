import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:isar/isar.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:taskgo/database/main_repository.dart';
import 'package:taskgo/features/add_task/add_task.dart';

import 'all_tasks_repository.dart';

class AllTasksProvider extends ChangeNotifier {
  //Add task repository for all DB operations
  final AllTasksRepository _repository = AllTasksRepository();

  //Creates a stream generator for the tasks list
  //Fires Immediately whenever the task list is updated
  Stream<List<Task>> listenTaskList() async* {
    yield* isarDb.tasks.where().watch(fireImmediately: true);
  }

  Future updateTaskStatus(Task task, BuildContext context) async {
    //Save the context value before calling any async method
    //As context can become null, in between async calls
    var overlayLoader = context.loaderOverlay;

    //Show a loader
    overlayLoader.show();

    //task updated On
    task.updatedOn = DateTime.now();

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
}
