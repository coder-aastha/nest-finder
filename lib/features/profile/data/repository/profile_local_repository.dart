import 'package:nest_finder/features/profile/data/data_source/local_data_source/local_data_source.dart';
import 'package:nest_finder/features/profile/domain/repository/profile_repository.dart';

class ProfileLocalRepository implements ProfileRepository {
  final ProfileLocalDataSource localDataSource;

  ProfileLocalRepository(this.localDataSource);

  @override
  Future<UserEntity?> getProfile() async {
    final userModel = localDataSource.getCachedUser();
    return userModel != null ? UserEntity.fromModel(userModel) : null;
  }

  @override
  Future<void> updateProfile(UserEntity user) async {
    await localDataSource.cacheUser(user.toModel());
  }
}

class UserEntity {
}
