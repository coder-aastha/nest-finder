import 'package:flutter/material.dart';
import 'package:nest_finder/app/app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nest_finder/features/auth/data/model/auth_hive_model.dart';


void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive and set up Flutter directory
  await Hive.initFlutter();
  
  // Register the UserModel adapter
  Hive.registerAdapter(UserModelAdapter());
  
  // Open the users box
  await Hive.openBox<UserModel>('users');
  
  runApp(
    const MyApp(),
  );
}