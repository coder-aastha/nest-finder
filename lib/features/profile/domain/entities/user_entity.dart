import 'package:nest_finder/features/profile/data/model/user_model.dart';

class UserEntity {
  final String id;
  final String name;
  final String profileImageUrl;

  UserEntity({required this.id, required this.name, required this.profileImageUrl});

  factory UserEntity.fromModel(UserModel model) {
    return UserEntity(
      id: model.id,
      name: model.name,
      profileImageUrl: model.profileImageUrl,
    );
  }

  UserModel toModel() {
    return UserModel(id: id, name: name, profileImageUrl: profileImageUrl);
  }
}
