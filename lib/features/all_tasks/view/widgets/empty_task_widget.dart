import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskgo/config/app_theme.dart';

class EmptyTaskWidget extends StatelessWidget {
  const EmptyTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Lottie.asset(
          'assets/lottie/search.json',
          repeat: false,
          width: MediaQuery.of(context).size.width,
          height: 360,
          fit: BoxFit.fitWidth,
        ),
        const Text(
          "No task found",
          style: AppTheme.headline3,
        ),
        const SizedBox(
          height: 18,
        ),
        const Text(
          "Tap + below to add a new task",
          style: AppTheme.text3,
        )
      ],
    );
  }
}
