import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nest_finder/features/profile/data/model/user_model.dart';

class ProfileRemoteDataSource {
  static const String _baseUrl = 'http://localhost:8800/api';

  Future<UserModel> fetchUserProfile(String userId) async {
    final response = await http.get(Uri.parse('$_baseUrl/users/$userId'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return UserModel.fromJson(data);
    } else {
      throw Exception('Failed to load user profile');
    }
  }

  Future<void> updateUserProfile(UserModel user) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/users/${user.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user profile');
    }
  }
}
