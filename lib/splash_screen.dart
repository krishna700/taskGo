import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskgo/config/config.dart';

import 'util/delayed_widget.dart';

///[SplashScreen] is the initial widget pushed in the stack
///After the splashScreen we navigate to the [HomeScreen]
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  //AnimationController for lottie animation of the logo
  late final AnimationController _lottieController;
  //init the animation controller
  @override
  void initState() {
    super.initState();

    _lottieController = AnimationController(vsync: this);
  }

  //Dispose the animation controller before disposing the widget
  @override
  void dispose() {
    _lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Lottie.asset(
                'assets/lottie/splash.json',
                controller: _lottieController,
                onLoaded: (composition) {
                  // Configure the AnimationController with the duration of the
                  // Lottie file and start the animation.
                  _lottieController
                    ..duration = composition.duration
                    ..forward().whenComplete(
                      //Navigate to home when animation is completed
                      () => _navigateToHome(),
                    );
                },
                width: MediaQuery.of(context).size.width,
                height: 160,
                fit: BoxFit.fitWidth,
              ),
            ),
            const DelayedWidget(
              key: Key("GO"),
              delayDuration: Duration(milliseconds: 1000),
              animationDuration: Duration(seconds: 1),
              animation: DelayedAnimations.SLIDE_FROM_RIGHT,
              child: Text(
                "GO",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

//This method navigates to home screen, after poping the splash screen
  void _navigateToHome() {
    Navigator.of(context).pushReplacementNamed(homeRoute);
  }
}
