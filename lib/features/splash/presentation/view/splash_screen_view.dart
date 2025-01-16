// lib/features/splash/presentation/splash_screen.dart
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:nest_finder/features/home/presentation/view/onboarding_view.dart'; // Import the next screen

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/splash_screen/nestfinder_animated_logo.gif',
      splashIconSize: 1500.0,
      centered: true,
      nextScreen: const OnboardingView(), // The screen that comes after splash
      backgroundColor: Colors.white,
      duration: 2700,
    );
  }
}
