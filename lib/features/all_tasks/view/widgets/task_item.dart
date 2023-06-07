import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskgo/config/app_theme.dart';
import 'package:taskgo/features/add_task/add_task.dart';
import 'package:taskgo/features/all_tasks/data/all_tasks_provider.dart';

import 'package:taskgo/util/constants.dart';
import 'package:taskgo/util/extension.dart';
import 'package:taskgo/util/util.dart';

///[TaskItem] is the widget which renders the task item throughout the app
///It creates a stateless widget for showing the task item

class TaskItem extends StatelessWidget {
  final Task task;
  const TaskItem({
    super.key,
    required this.task,
  });
  @override
  Widget build(BuildContext context) {
    //Provider for all tasks
    final allTasksProvider =
        Provider.of<AllTasksProvider>(context, listen: false);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          //Navigates to edit task screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(
                task: task,
              ),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Checkbox for completing the task
            InkWell(
              onTap: () {
                //update the task isCompleted value
                task.isCompleted = !(task.isDone);
                //update the task in provider
                allTasksProvider.updateTaskStatus(task, context);
              },
              child: SizedBox(
                height: 24,
                width: 24,
                //Checkbox size is small which can lead to bad ux
                //So we add a absorp pointer which will absorp the hits
                //In response onTap logic is handled in the inkWell above
                child: AbsorbPointer(
                  absorbing: true,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Checkbox(
                        checkColor: Colors.white,
                        fillColor: task.isDone
                            ? MaterialStateProperty.all(primaryColor)
                            : MaterialStateProperty.all(Colors.grey[500]),
                        value: task.isDone,
                        shape: const CircleBorder(),
                        onChanged: (value) {}),
                  ),
                ),
              ),
            ),

            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //task name
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          task.taskName,
                          style: task.isDone
                              ? const TextStyle(
                                  fontSize: 18,
                                  decoration: TextDecoration.lineThrough,
                                  color: Color(0xFF2A2E49),
                                  fontWeight: FontWeight.w400,
                                )
                              : TextStyle(
                                  fontSize: 18,
                                  color: task.isOverDue
                                      ? Colors.red
                                      : const Color(0xFF2A2E49),
                                  fontWeight: FontWeight.w400,
                                ),
                        ),
                      ),
                      task.isReminderEnabled
                          ? Icon(
                              Icons.notifications_active_outlined,
                              color: primaryColor.withOpacity(0.4),
                            )
                          : const Offstage(),
                    ],
                  ),
                  const SizedBox(height: 2),
                  //task description if valid string
                  isStringValid(task.description)
                      ? Text(task.description!, style: AppTheme.text3)
                      : const Offstage(),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      //task priority
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color:
                              (Constants.taskPrioritiesColor[task.priority - 1])
                                  .withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          Constants.taskPriorities[task.priority - 1],
                          style: AppTheme.text3,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      //task deadline
                      Row(
                        children: [
                          Icon(
                            Icons.timer_sharp,
                            color: Colors.grey[300]!,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            task.hasDueDate
                                ? task.dueDateTime!.format(Constants.deadline)
                                : 'No Deadline',
                            style: task.isOverDue
                                ? const TextStyle(
                                    fontSize: 18,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w400,
                                  )
                                : AppTheme.text3,
                          ),
                        ],
                      ),
                    ],
                  ),
                  //Creates share task button
                  Row(
                    children: [
                      const Spacer(),
                      ElevatedButton.icon(
                        onPressed: () {
                          //Call provider method to share task
                          allTasksProvider.shareTask(task);
                        },
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          elevation: MaterialStatePropertyAll(0),
                        ),
                        icon: Icon(
                          Icons.share,
                          color: primaryColor.withOpacity(0.8),
                        ),
                        label: Text(
                          "Share task",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 0.11,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
