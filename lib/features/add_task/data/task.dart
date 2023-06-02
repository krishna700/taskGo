import 'package:isar/isar.dart';

part 'task.g.dart';

///[Task] class is the object model that will used for adding tasks
///It's annotated as [Collection] to enable isar schema

@collection
@Name("Task")
class Task {
  //Auto Increment task id
  Id id = Isar.autoIncrement;
  //Late initialsed Task name
  late String taskName;
  //Nullable task description
  String? description;
  //Track task status
  bool? isCompleted;

  //Task priority
  //3 is the highest priority.
  //2 is medium priority.
  //1 is lowest priority.
  late int priority;

  //Enable task reminder
  late bool isReminderEnabled;

  //Nullable Task due date & Time
  DateTime? dueDateTime;
  //Task created on
  late DateTime createdOn;
  //Task updated on
  late DateTime updatedOn;

  ///Getters for task details
  ///

  bool get isTaskCompleted => isCompleted != null && isCompleted!;

  bool get isTaskHighPriority => priority == 3;
  bool get isTaskMediumPriority => priority == 2;
  bool get isTaskLowPriority => priority == 1;
}
