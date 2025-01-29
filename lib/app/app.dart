import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nest_finder/app/di/di.dart';
import 'package:nest_finder/core/app_theme/app_theme.dart';
import 'package:nest_finder/features/splash/presentation/view/splash_screen_view.dart';
import 'package:nest_finder/features/splash/presentation/view_model/splash_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nest Finder',
      theme: AppTheme.getApplicationTheme(isDarkMode: false),
      home: BlocProvider.value(
        value: getIt<SplashCubit>(),
        child: const SplashScreenView(),
      ),
    );
  }
}
