part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class UploadImage extends RegisterEvent {
  final File file;

  const UploadImage({
    required this.file,
  });
}

class RegisterUser extends RegisterEvent {
  final BuildContext context;
  final String username;
  final String email;
  final String password;
  final String confirmPassword;
  final String? image;

  const RegisterUser({
    required this.context,
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.image,
  });
}
