import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:nest_finder/app/usecase/usecase.dart';
import 'package:nest_finder/core/error/failure.dart';
import 'package:nest_finder/features/auth/domain/repository/auth_repository.dart';

class LoginParams extends Equatable {
  final String username;
  final String password;

  const LoginParams({
    required this.username,
    required this.password,
  });

  // Initial Constructor
  const LoginParams.initial()
      : username = '',
        password = '';

  @override
  List<Object> get props => [username, password];
}

class LoginUseCase implements UsecaseWithParams<String, LoginParams> {
  final IAuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(LoginParams params) {
    return repository.loginStudent(params.username, params.password);
  }
}
