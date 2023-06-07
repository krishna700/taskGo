import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskgo/config/app_theme.dart';
import 'package:taskgo/features/all_tasks/data/all_tasks_provider.dart';
import 'package:taskgo/features/all_tasks/view/tasks_list.dart';
import 'package:taskgo/util/constants.dart';

import 'package:taskgo/util/util.dart';

///[TaskDashboardScreen] renders the dashboard for the tasks
///This widget creates the gridview for the dashBoard items
///[TaskDashboardScreen] is a consumer of [AllTasksProvider]
///The UI is updated whenever any operation happens in the taskCollection
class TaskDashboardScreen extends StatefulWidget {
  const TaskDashboardScreen({super.key});

  @override
  State<TaskDashboardScreen> createState() => _TaskDashboardScreenState();
}

class _TaskDashboardScreenState extends State<TaskDashboardScreen> {
  //Create global keys for all the task list
  //this will enable us to scroll to that particular list
  late Map<String, GlobalKey> _taskListGlobalKeys;
  //This method is invoked whenever the widget is created
  //We will init the tasks listener here
  @override
  void initState() {
    super.initState();
    final allTasksProvider =
        Provider.of<AllTasksProvider>(context, listen: false);
    //init taskList Global keys
    _taskListGlobalKeys = {};
    //Add unique keys according to the task list
    for (final String element in Constants.taskBoardTaskLists) {
      _taskListGlobalKeys[element] = GlobalKey();
    }

    allTasksProvider.initAllTasksProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Consumer of allTasksProvider
      //Updates the UI whenever tasks collection changes
      body: Consumer<AllTasksProvider>(builder: (
        context,
        proivder,
        w,
      ) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: [
              appBarTitle("Task ", "Go"),
              const Divider(),
              taskCategoryGridView(proivder),
              getVericalGap(),
              const Divider(),
              _createDashboardTaskList(proivder),
              getVericalGap(),
            ]),
          ),
        );
      }),
    );
  }

  Widget taskCategoryGridView(AllTasksProvider provider) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        childAspectRatio: 1.5,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: Constants.taskDashboardItems.length,
      itemBuilder: (BuildContext context, int index) {
        final String itemKey =
            Constants.taskDashboardItems.keys.toList()[index];
        var context = _taskListGlobalKeys[itemKey]?.currentContext;
        return InkWell(
            onTap: () {
              switch (itemKey) {
                //OnTap upcoming tasks in dashBoard item
                case Constants.upcomingTasks:
                  //return if upcoming taskcount is 0
                  if (provider.getUpcomingTasksCount() <= 0) {
                    return;
                  }
                  //If context is not null, scroll to the list
                  if (context != null) {
                    Scrollable.ensureVisible(context);
                  }
                  break;
                //OnTap Overdue tasks in dashBoard item
                case Constants.overdueTasks:
                  //return if overdue taskcount is 0
                  if (provider.getOverDueTasksCount() <= 0) {
                    return;
                  }
                  //If context is not null, scroll to the list
                  if (context != null) {
                    Scrollable.ensureVisible(context);
                  }
                  break;
                //OnTap today's tasks in dashBoard item
                case Constants.todayTasks:
                  //return if todays taskcount is 0
                  if (provider.getTodaysTasksCount() <= 0) {
                    return;
                  }
                  //If context is not null, scroll to the list
                  if (context != null) {
                    Scrollable.ensureVisible(context);
                  }
                  break;
              }
            },
            child: taskCategoryItemWidget(index, provider));
      },
    );
  }

  Widget taskCategoryItemWidget(int index, AllTasksProvider provider) {
    //Get the itemKey from dashboard items
    String itemKey = Constants.taskDashboardItems.keys.toList()[index];
    return Container(
      decoration: BoxDecoration(
        gradient: Constants.taskDashboardItems.values.toList()[index],
        borderRadius: BorderRadius.circular(32),
        boxShadow: AppTheme.getShadow(
          Constants.taskDashboardItems.values.toList()[index].colors[1],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      itemKey,
                      maxLines: index.isEven ? 3 : 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "${provider.getTaskCountFromKey(
                itemKey,
              )} Tasks",
            ),
          ],
        ),
      ),
    );
  }

  //Creates taskList of all the dashboard items
  //Except all tasks item
  Widget _createDashboardTaskList(
    AllTasksProvider provider,
  ) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: Constants.taskBoardTaskLists.length,
      itemBuilder: (BuildContext context, int index) {
        //Get the dashBoardItemKey
        String itemKey = Constants.taskBoardTaskLists[index];

        return TaskList(
          key: _taskListGlobalKeys[itemKey],
          //Get the task stream from the provider
          stream: provider.getTaskStreamFromKey(itemKey),
          title: itemKey,
        );
      },
    );
  }
}
