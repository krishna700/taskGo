import 'package:flutter/material.dart';
import 'package:taskgo/config/app_theme.dart';
import 'package:taskgo/util/constants.dart';
import 'package:taskgo/util/extension.dart';

class TaskDashboardScreen extends StatefulWidget {
  const TaskDashboardScreen({super.key});

  @override
  State<TaskDashboardScreen> createState() => _TaskDashboardScreenState();
}

class _TaskDashboardScreenState extends State<TaskDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Task ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 28,
                          ),
                        ),
                        TextSpan(
                          text: 'Go',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              _topBar(),
              taskCategoryGridView(),
            ]),
          ),
        ),
      ),
    );
  }

  Widget taskCategoryGridView() {
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
        return taskCategoryItemWidget(index);
      },
    );
  }

  _topBar() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateTime.now().format(Constants.monthDayYear),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Hero(
                tag: "heroSearch",
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: primaryColor),
                  ),
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        child: Text(
                          'Search Tasks here',
                          style: AppTheme.text3,
                        ),
                      ),
                      Icon(
                        Icons.search_rounded,
                        color: primaryColor,
                      ),
                    ],
                  ),
                )
                //.addRipple(onTap: () => Navigator.pushNamed(context, PagePath.search),),
                ),
          ),
        ],
      ),
    );
  }

  Widget taskCategoryItemWidget(int index) {
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
                      Constants.taskDashboardItems.keys.toList()[index],
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
            const Text(
              '0 Task',
            ),
          ],
        ),
      ),
    );
  }
}
