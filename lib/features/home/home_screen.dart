import 'package:flutter/material.dart';

import 'package:taskgo/features/all_tasks/all_tasks.dart';

import '../../config/config.dart';
import '../../util/curved_nav_bar/curved_nav_bar.dart';

/// [HomeScreen] creates a [StatefulWidget] for the home Screen
/// It contains the bottom navigation bar which consists of
/// AddTaskScreen, TaskDashboardScreen & Search Tasks

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavBar(
      extendBody: false,
      //Action bar item for adding task
      actionButton: CurvedActionBar(
        onTab: (value) {
          //Pushes the AddTaskScreen in the stack
          Navigator.of(context).pushNamed(addTaskRoute);
        },
        activeIcon: Container(
          padding: const EdgeInsets.all(8),
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: const Icon(
            Icons.add,
            size: 50,
            color: Colors.blue,
          ),
        ),
        inActiveIcon: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 10,
                spreadRadius: 0.2,
                color: Colors.grey,
              ),
            ],
          ),
          child: const Icon(
            Icons.add,
            size: 50,
            color: primaryColor,
          ),
        ),
        text: "Add Task",
      ),
      activeColor: primaryColor,
      navBarBackgroundColor: Colors.white,
      inActiveColor: Colors.black45,
      //AppBar item for home & search
      appBarItems: [
        FABBottomAppBarItem(
          activeIcon: const Icon(
            Icons.dashboard_rounded,
            color: Colors.blue,
          ),
          inActiveIcon: const Icon(
            Icons.dashboard_rounded,
            color: Colors.black26,
          ),
          text: 'Dashboard',
        ),
        FABBottomAppBarItem(
          activeIcon: const Icon(
            Icons.task_sharp,
            color: Colors.blue,
          ),
          inActiveIcon: const Icon(
            Icons.task_sharp,
            color: Colors.black26,
          ),
          text: 'All tasks',
        ),
      ],
      //Screens for showing the screens on tap navigation bar items
      bodyItems: const [
        TaskDashboardScreen(),
        AllTasksScreen(),
      ],
    );
  }
}
