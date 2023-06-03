import 'package:curved_nav_bar/curved_bar/curved_action_bar.dart';
import 'package:curved_nav_bar/fab_bar/fab_bottom_app_bar_item.dart';
import 'package:curved_nav_bar/flutter_curved_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:taskgo/config/config.dart';
import 'package:taskgo/features/all_tasks/all_tasks.dart';
import 'package:taskgo/features/search_task/search_task.dart';

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
      actionButton: CurvedActionBar(
        onTab: (value) {},
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
            color: Colors.orange,
          ),
        ),
        text: "Add Task",
      ),
      activeColor: Colors.blue,
      navBarBackgroundColor: Colors.white,
      inActiveColor: Colors.black45,
      appBarItems: [
        FABBottomAppBarItem(
          activeIcon: const Icon(
            Icons.home,
            color: Colors.blue,
          ),
          inActiveIcon: const Icon(
            Icons.home,
            color: Colors.black26,
          ),
          text: 'Home',
        ),
        FABBottomAppBarItem(
          activeIcon: const Icon(
            Icons.search,
            color: Colors.blue,
          ),
          inActiveIcon: const Icon(
            Icons.search,
            color: Colors.black26,
          ),
          text: 'Search',
        ),
      ],
      bodyItems: const [
        TaskDashboardScreen(),
        SearchTaskScreen(),
      ],
    );
  }
}
