import 'package:flutter/material.dart';
import 'package:nest_finder/app/app.dart';
import 'package:nest_finder/app/di/di.dart';
import 'package:nest_finder/core/network/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();

  await initDependencies();
  runApp(
    const MyApp(),
  );
}
