import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:taskgo/features/add_task/data/task.dart';

class MainRepository {
  static late final Isar isarDb;

//Init the local database
  static void initDB() async {
    //Check if there is no instance available of the db
    //If instance names is empty
    //we can open a new db instance
    if (Isar.instanceNames.isEmpty) {
      //Get the applicationDirectory
      final dir = await getApplicationDocumentsDirectory();
      //Pass the directory path to isar for opening a new isar instance
      //Set the instance for our global db variable
      isarDb = await Isar.open(
        //Type of data model that will be stored in the database
        [TaskSchema],
        directory: dir.path,
      );

      return;
    }
    //We already have an open instance of isar
    //Set the default instance for our global db variable
    isarDb = Isar.getInstance(Isar.defaultName)!;
  }
}
