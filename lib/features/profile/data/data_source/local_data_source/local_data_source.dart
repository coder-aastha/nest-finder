import 'dart:convert';
import 'package:nest_finder/features/profile/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileLocalDataSource {
  final SharedPreferences prefs;

  ProfileLocalDataSource(this.prefs);

  Future<void> cacheUser(UserModel user) async {
    await prefs.setString('cachedUser', user.toJson().toString());
  }

  UserModel? getCachedUser() {
    final jsonString = prefs.getString('cachedUser');
    if (jsonString != null) {
      return UserModel.fromJson(jsonDecode(jsonString));
    }
    return null;
  }
}
