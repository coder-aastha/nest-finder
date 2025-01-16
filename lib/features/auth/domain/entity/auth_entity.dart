import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? userId;
  final String username;
  final String password;
  final String confirmPassword;

  const AuthEntity({
    this.userId,
    required this.confirmPassword,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props =>
      [userId, confirmPassword, username, password];
}
