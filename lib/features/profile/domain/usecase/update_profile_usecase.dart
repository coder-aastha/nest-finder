import 'package:nest_finder/features/profile/domain/entities/user_entity.dart';
import 'package:nest_finder/features/profile/domain/repository/profile_repository.dart';

class UpdateProfileUseCase {
  final ProfileRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<void> call(UserEntity user) => repository.updateProfile(user);
}
