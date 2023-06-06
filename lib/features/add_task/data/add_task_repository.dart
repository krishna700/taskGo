import 'package:taskgo/database/main_repository.dart';
import 'package:taskgo/features/add_task/add_task.dart';

class AddTaskRepository {
  Future saveTask(Task task) async {
    try {
      await isarDb.writeTxn(() async {
        await isarDb.tasks.put(task);
      });
    } catch (_) {}
  }

  Future<bool> deleteTask(Task task) async {
    try {
      await isarDb.writeTxn(() async {
        await isarDb.tasks.delete(task.id!);
      });
      return true;
    } catch (_) {
      return false;
    }
  }
}
