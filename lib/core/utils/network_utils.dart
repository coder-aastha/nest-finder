import 'package:flutter/material.dart';
import 'package:nest_finder/core/common/internet_checker/internet_checker.dart';

void checkInternet(BuildContext context) async {
  bool isConnected = await InternetChecker.hasInternetConnection();

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        isConnected ? 'Connected to the Internet!' : 'No Internet Connection!',
      ),
      duration: const Duration(seconds: 2),
    ),
  );
}
