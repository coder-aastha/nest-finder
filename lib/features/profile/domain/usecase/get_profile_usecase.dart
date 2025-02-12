import 'package:nest_finder/features/profile/domain/entities/user_entity.dart';
import 'package:nest_finder/features/profile/domain/repository/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository repository;

  GetProfileUseCase(this.repository);

  Future<UserEntity?> call() => repository.getProfile();
}
