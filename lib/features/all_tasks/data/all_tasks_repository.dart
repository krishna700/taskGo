import 'package:taskgo/database/main_repository.dart';
import 'package:taskgo/features/add_task/data/task.dart';

class AllTasksRepository {
  Future updateTaskStatus(Task task) async {
    try {
      await isarDb.writeTxn(() async {
        await isarDb.tasks.put(task);
      });
    } catch (_) {}
  }
}
