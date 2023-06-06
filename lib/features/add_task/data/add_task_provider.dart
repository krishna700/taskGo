import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:taskgo/features/add_task/add_task.dart';
import 'package:taskgo/util/util.dart';

class AddTaskProvider extends ChangeNotifier {
  //Add task repository for all DB operations
  final AddTaskRepository _repository = AddTaskRepository();

  Future saveTask(Task task, BuildContext context) async {
    //Save the context value before calling any async method
    //As context can become null, in between async calls
    var navigator = Navigator.of(context);
    var overlayLoader = context.loaderOverlay;
    //Show error message & return if task name is empty
    if (task.taskName.isEmpty) {
      AlertController.show(
        "Unable to save!",
        "Task name can't be empty",
        TypeAlert.warning,
      );
      return;
    }

    //task name is not empty, save the task
    //Show a loader
    overlayLoader.show();
    //init task createdOn, if id is null
    if (task.id == null) {
      task.createdOn = DateTime.now();
    }
    //init task updated On
    task.updatedOn = DateTime.now();
    //Save the task
    await _repository.saveTask(task);
    //hide the loader
    overlayLoader.hide();
    //show success alert
    AlertController.show(
      "Success!",
      "Task saved successfully",
      TypeAlert.success,
    );
    //Pop the add task page
    navigator.pop();
  }

  Future deleteTask(
    BuildContext context,
    Task task,
  ) async {
    //Save the context value before calling any async method
    //As context can become null, in between async calls
    var navigator = Navigator.of(context);
    var overlayLoader = context.loaderOverlay;

    //Show a confirmation dialog to delete the task
    showConfirmAlertDialog(
      context: context,
      onCancel: () {
        //Pop the dialog, user pressed cancelled
        navigator.pop();
      },
      onConfirm: () async {
        //Show a loader
        overlayLoader.show();
        //delete the task from db
        bool isDeleted = await _repository.deleteTask(task);
        //hide the loader
        overlayLoader.hide();

        if (isDeleted) {
          //show success alert
          AlertController.show(
            "Success!",
            "Task deleted successfully",
            TypeAlert.success,
          );
          //Pop the delete popup
          navigator.pop();
          //Pop the add task page
          navigator.pop();
          return;
        }
        //show error alert
        AlertController.show(
          "Error!",
          "Unable to delete the task",
          TypeAlert.error,
        );
        //Pop the delete popup
        navigator.pop();
      },
      title: "Delete task?",
      description: "Are you sure you want to delete the task",
    );
  }
}
