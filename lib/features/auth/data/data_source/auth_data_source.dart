import 'dart:io';

import 'package:nest_finder/features/auth/domain/entity/auth_entity.dart';


abstract interface class IAuthDataSource{
  Future<String> loginUser(String email, String password);

  Future<void> registerUser(AuthEntity user);

  Future<AuthEntity> getCurrentUser();

  Future<String> uploadProfilePicture(File file);
}