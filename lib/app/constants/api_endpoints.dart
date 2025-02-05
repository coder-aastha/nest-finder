class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration recieveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://localhost:8800/api/";

  //Auth
  static const String login = "auth/login";
  static const String register = "auth/register";
  static const String uploadImage = "auth/upload";
}
