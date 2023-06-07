import 'package:isar/isar.dart';
import 'package:taskgo/util/constants.dart';
import 'package:taskgo/util/util.dart';

part 'task.g.dart';

///[Task] class is the object model that will used for adding tasks
///It's annotated as [Collection] to enable isar schema

@collection
@Name("Task")
class Task {
  //Auto Increment task id
  Id? id;
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

  bool get isDone => isCompleted != null && isCompleted!;

  bool get hasDueDate => dueDateTime != null;

  //Getter for is task overdue
  bool get isOverDue {
    var now = DateTime.now();
    //if no due date, return false
    if (!hasDueDate) {
      return false;
    }
    //if current time is after dueDateTime, return true
    //Task is overdue
    return now.isAfter(dueDateTime!) && !isDone;
  }

  bool get isTodaysTask {
    //if no due date, return false
    if (!hasDueDate) {
      return false;
    }
    //return is data today
    //which implies the task is today's task
    return isDateToday(dueDateTime!) && !isDone;
  }

  bool get isUpcomingTask {
    //if no due date, return false
    if (!hasDueDate) {
      return false;
    }
    //return is data with in 10
    //is not overdue
    //which implies the task is today's task
    return isDateUpcoming(dueDateTime!) && !isOverDue && !isDone;
  }
}
