

import 'package:hive_flutter/adapters.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String email;

  @HiveField(1)
  String password;

  UserModel({
    required this.email,
    required this.password,
  });
}