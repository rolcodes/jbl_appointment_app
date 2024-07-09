import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:appointment_app/new_features/screen/landing_screen/landing_screen.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: LottieBuilder.asset(
              'assets/lottie/jbl_19x9.mp4.lottie.json',
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
      nextScreen: LandingScreen(),
      splashIconSize: 1000,
      centered: true,
      animationDuration: Duration(seconds: 3),
      curve: Curves.fastLinearToSlowEaseIn,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
