import 'package:flutter/material.dart';
import 'package:nest_finder/features/profile/domain/entities/user_entity.dart';
import 'package:nest_finder/features/profile/domain/usecase/get_profile_usecase.dart';
import 'package:nest_finder/features/profile/domain/usecase/update_profile_usecase.dart';

class ProfileViewModel with ChangeNotifier {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  UserEntity? _user;
  UserEntity? get user => _user;

  ProfileViewModel({required this.getProfileUseCase, required this.updateProfileUseCase});

  Future<void> fetchProfile() async {
    _user = await getProfileUseCase();
    notifyListeners();
  }

  Future<void> updateProfileName(String name) async {
    if (_user != null) {
      _user = UserEntity(id: _user!.id, name: name, profileImageUrl: _user!.profileImageUrl);
      await updateProfileUseCase(_user!);
      notifyListeners();
    }
  }
}
