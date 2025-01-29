import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:nest_finder/app/usecase/usecase.dart';
import 'package:nest_finder/core/error/failure.dart';
import 'package:nest_finder/features/auth/domain/entity/auth_entity.dart';
import 'package:nest_finder/features/auth/domain/repository/auth_repository.dart';


class RegisterUserParams extends Equatable {
  final String username;
  final String email;
  final String password;
  // final String confirmPassword;

  const RegisterUserParams({
    required this.username,
    required this.email,
    required this.password,
    // required this.confirmPassword,
  });

  //intial constructor
  const RegisterUserParams.initial({
    required this.username,
    required this.email,
    required this.password,
    // required this.confirmPassword,
  });

  @override
  List<Object?> get props =>
      [username, email, password];
}

class RegisterUseCase implements UsecaseWithParams<void, RegisterUserParams> {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final authEntity = AuthEntity(
      username: params.username,
      email: params.email,
      password: params.password,
      // confirmPassword: params.confirmPassword,
    );
    return repository.registerUser(authEntity);
  }
}
