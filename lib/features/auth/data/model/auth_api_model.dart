import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nest_finder/features/auth/domain/entity/auth_entity.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String username;
  final String email;
  final String? password;
  final String? avatar;

  const AuthApiModel({
    this.id,
    required this.username,
    required this.email,
    this.password,
    this.avatar,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // To Entity
  AuthEntity toEntity() {
    return AuthEntity(
      userId: id,
      username: username,
      email: email,
      password: password ?? '',
      avatar: avatar,
    );
  }

  // From Entity
  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
      id: entity.userId, // Fixed: Ensure ID is also mapped
      username: entity.username,
      email: entity.email,
      password: entity.password,
      avatar: entity.avatar,
    );
  }

  @override
  List<Object?> get props => [id, username, email, password, avatar];
}
