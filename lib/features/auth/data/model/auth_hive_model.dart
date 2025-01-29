import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nest_finder/app/constants/hive_constant.dart';
import 'package:nest_finder/features/auth/domain/entity/auth_entity.dart';
import 'package:uuid/uuid.dart';

//flutter packages pub run build_runner build
part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String password;

  @HiveField(4) // ✅ Add avatar field
  final String? avatar;

  AuthHiveModel({
    String? userId,
    required this.username,
    required this.email,
    required this.password,
    this.avatar,
  }) : userId = userId ?? const Uuid().v4();

  AuthHiveModel.initial()
      : userId = const Uuid().v4(),
        username = '',
        email = '',
        password = '',
        avatar = '';

  factory AuthHiveModel.fromEntity(AuthEntity entity) {
    return AuthHiveModel(
      userId: entity.userId,
      username: entity.username,
      email: entity.email,
      password: entity.password,
      avatar: entity.avatar, // ✅ Map avatar
    );
  }

  AuthEntity toEntity() {
    return AuthEntity(
      userId: userId,
      username: username,
      email: email,
      password: password,
      avatar: avatar, // ✅ Map avatar
    );
  }

  @override
  List<Object?> get props => [userId, username, email, password, avatar];
}
