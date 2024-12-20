import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:nest_finder/core/app_theme/app_theme.dart';
import 'package:nest_finder/view/onboarding_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      home: AnimatedSplashScreen(
        splash: 'assets/images/splash_screen/nestfinder_animated_logo.gif',
        splashIconSize: 1500.0,
        centered: true,
        nextScreen: const OnboardingView(),
        backgroundColor: Colors.white,
        duration: 2700,
      ),
    );
  }
}
