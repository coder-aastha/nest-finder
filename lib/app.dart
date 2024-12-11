import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:nest_finder/view/onboarding_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: 'assets/images/nestfinder_animated_logo.gif',
        splashIconSize: 1500.0,
        centered: true,
        nextScreen: const OnboardingView(),
        backgroundColor: Colors.white,
        duration: 2700,
      ),
    );
  }
}
