import 'package:taskgo/database/main_repository.dart';
import 'package:taskgo/features/add_task/add_task.dart';

///[AddTaskRepository] handles all the DB calls for task Create Update Delete
class AddTaskRepository {
  //Saves a task in db
  Future saveTask(Task task) async {
    try {
      //add a delay
      Future.delayed(const Duration(milliseconds: 200));
      //put the task in collection
      await isarDb.writeTxn(() async {
        await isarDb.tasks.put(task);
      });
      //add a delay
      Future.delayed(const Duration(milliseconds: 2000));
    } catch (_) {
      //Catch any error
      //Send it to a crash reporting tool
    }
  }

//Deletes a task from db
  Future<bool> deleteTask(Task task) async {
    try {
      //add a delay
      Future.delayed(const Duration(milliseconds: 200));
      //put a task from collection using id
      await isarDb.writeTxn(() async {
        await isarDb.tasks.delete(task.id!);
      });
      //add a delay
      Future.delayed(const Duration(milliseconds: 2000));
      return true;
    } catch (_) {
      //Catch any error
      //Send it to a crash reporting tool
      return false;
    }
  }
}
