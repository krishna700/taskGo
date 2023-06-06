import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:taskgo/config/config.dart';
import 'package:taskgo/features/add_task/add_task.dart';

import 'features/all_tasks/all_tasks.dart';

/// [TaskGoApp] is the root of the application.
/// This Widget gives an entry point of our application.
/// After the flutter engine starts the MaterialApp is pushed,
/// then either initial route or home widget is pushed.
class TaskGoApp extends StatelessWidget {
  const TaskGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Provider for add/update task
        ChangeNotifierProvider(
          create: (_) => AddTaskProvider(),
        ),
        //Provider for all tasks screen
        ChangeNotifierProvider(
          create: (_) => AllTasksProvider(),
        ),
      ],
      //Loader overlay for loading dialog
      child: GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayWidget: const Center(
          child: SpinKitPulse(
            color: primaryColor,
            size: 50.0,
          ),
        ),
        //Material app
        child: MaterialApp(
          title: 'TaskGo',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getLightTheme(),
          themeMode: ThemeMode.light,
          //Adds the [DropdownAlert] in the main widget using Stack
          builder: (context, child) => SafeArea(
            child: Stack(
              children: [
                child!,
                const DropdownAlert(),
              ],
            ),
          ),
          //Specifies the initial route of the app
          //This route/widget is first pushed in the stack when the app starts
          initialRoute: splashRoute,
          //Dynamic route generator of the app
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      ),
    );
  }
}
