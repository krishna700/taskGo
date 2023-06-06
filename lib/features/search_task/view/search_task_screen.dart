import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskgo/config/config.dart';

class SearchTaskScreen extends StatefulWidget {
  const SearchTaskScreen({super.key});

  @override
  State<SearchTaskScreen> createState() => _SearchTaskScreenState();
}

class _SearchTaskScreenState extends State<SearchTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Search ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                  fontSize: 28,
                ),
              ),
              TextSpan(
                text: 'Task',
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: _buildBody(),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      child: Lottie.asset(
        'assets/lottie/search.json',
        // controller: _lottieController,
        // onLoaded: (composition) {
        //   // Configure the AnimationController with the duration of the
        //   // Lottie file and start the animation.
        //   _lottieController
        //     ..duration = composition.duration
        //     ..forward();
        // },
        width: MediaQuery.of(context).size.width,
        height: 160,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
