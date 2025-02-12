import 'package:nest_finder/features/profile/data/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileRemoteDataSource {
  final http.Client client;

  ProfileRemoteDataSource(this.client);

  Future<UserModel> fetchUserProfile(String userId) async {
    final response = await client.get(Uri.parse('https://api.example.com/users/$userId'));

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch user profile');
    }
  }
}
