import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:taskgo/features/add_task/data/task.dart';

late final Isar isarDb;

//Init the local database
void initDB() async {
  //Get the applicationDirectory
  final dir = await getApplicationDocumentsDirectory();
  //Pass the directory path to isar for opening a new isar instance
  isarDb = await Isar.open(
    //Type of data model that will be stored in the database
    [TaskSchema],
    directory: dir.path,
  );
}
