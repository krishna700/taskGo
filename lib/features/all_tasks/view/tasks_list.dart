import 'package:flutter/material.dart';
import 'package:taskgo/config/app_theme.dart';
import 'package:taskgo/util/util.dart';

import '../../add_task/add_task.dart';

import 'widgets/task_item.dart';

class TaskList extends StatelessWidget {
  final String title;
  final Stream<List<Task>>? stream;

  const TaskList({
    super.key,
    required this.stream,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    //Stream builder for all tasks
    return StreamBuilder(
      //Gets the stream builder created in provider
      stream: stream,
      builder: (context, snapshot) {
        //Error encountered, show a alert dialog
        if (snapshot.hasError) {
          return const Offstage();
        } else if (snapshot.hasData) {
          final tasks = snapshot.data;
          //Check the tasks list is not empty
          //If true render the tasklist
          if (tasks != null && tasks.isNotEmpty) {
            //Creates a lazy builder for the tasks list
            //the builder is called only for the tasks that are visible
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getVericalGap(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    title,
                    style: AppTheme.headline2,
                  ),
                ),
                getVericalGap(),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return TaskItem(task: task);
                    }),
              ],
            );
          }
          //else render the empty task widget
          else {
            return const Offstage();
          }
        }
        //Returned when snapshot is loading
        return const Offstage();
      },
    );
  }
}
