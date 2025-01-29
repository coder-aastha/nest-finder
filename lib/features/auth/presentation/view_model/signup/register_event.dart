part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class LoadCoursesAndBatches extends RegisterEvent {}

class RegisterUser extends RegisterEvent {
  final BuildContext context;
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  const RegisterUser({
    required this.context,
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}
