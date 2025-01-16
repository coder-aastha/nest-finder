// lib/main.dart
import 'package:flutter/material.dart';
import 'package:nest_finder/core/app_theme/app_theme.dart';
import 'package:nest_finder/features/splash/presentation/view/splash_screen_view.dart'; // Import the new splash screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      home: const SplashScreenView(), // Use the new SplashScreen widget
    );
  }
}
