import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:taskgo/features/all_tasks/all_tasks.dart';
import 'package:taskgo/features/all_tasks/view/widgets/empty_task_widget.dart';
import 'package:taskgo/features/all_tasks/view/widgets/task_item.dart';
import 'package:taskgo/util/util.dart';

///[AllTasksScreen] create a widget for showing all the tasks in DB
/// Uses a stream builder to show the tasks in realtime

class AllTasksScreen extends StatefulWidget {
  const AllTasksScreen({super.key});

  @override
  State<AllTasksScreen> createState() => _AllTasksScreenState();
}

class _AllTasksScreenState extends State<AllTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //As this is in home screen, remove the back button
        //Basically disable automatically imply leading
        automaticallyImplyLeading: false,
        elevation: 0.5,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: appBarTitle("All ", "Tasks"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: _buildBody(),
        ),
      ),
    );
  }

  //Creates the main body of widget

  Widget _buildBody() {
    final allTasksProvider =
        Provider.of<AllTasksProvider>(context, listen: false);
    //Stream builder for all tasks
    return StreamBuilder(
      //Gets the stream builder created in provider
      stream: allTasksProvider.listenTaskList(),
      builder: (context, snapshot) {
        //Error encountered, show a alert dialog
        if (snapshot.hasError) {
          AlertDialog(
            content: Text(snapshot.error.toString()),
          );
        } else if (snapshot.hasData) {
          final tasks = snapshot.data;
          //Check the tasks list is not empty
          //If true render the tasklist
          if (tasks != null && tasks.isNotEmpty) {
            //Creates a lazy builder for the tasks list
            //the builder is called only for the tasks that are visible
            return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return TaskItem(task: task);
                });
          }
          //else render the empty task widget
          else {
            return const EmptyTaskWidget();
          }
        }
        //Returned when snapshot is loading
        return const CircularProgressIndicator();
      },
    );
  }
}
