import 'package:connectivity_plus/connectivity_plus.dart';

class InternetChecker {
  /// Checks if the device has an active internet connection.
  static Future<bool> hasInternetConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }

    return false; // No internet connection
  }

  /// Stream to listen to connectivity changes.
  static Stream<ConnectivityResult> get connectivityStream =>
      Connectivity().onConnectivityChanged;
}
