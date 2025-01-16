part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class LoadCoursesAndBatches extends RegisterEvent {}

class RegisterStudent extends RegisterEvent {
  final BuildContext context;
  final String username;
  final String password;
  final String confirmPassword;

  const RegisterStudent({
    required this.context,
    required this.username,
    required this.password,
    required this.confirmPassword,
  });
}
