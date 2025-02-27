import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? userId;
  final String username;
  final String email;
  final String password;
  final String? avatar;
  // final String confirmPassword;

  const AuthEntity({
    this.userId,
    // required this.confirmPassword,
    required this.username,
    required this.email,
    required this.password,
    this.avatar,
  });

  @override
  List<Object?> get props =>
      [userId, username, email, password, avatar];
}
