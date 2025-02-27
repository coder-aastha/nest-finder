import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nest_finder/features/about/data/model/about_model.dart';

abstract class AboutRemoteDataSource {
  Future<AboutModel> fetchAboutData();
}

class AboutRemoteDataSourceImpl implements AboutRemoteDataSource {
  final http.Client client;

  AboutRemoteDataSourceImpl({required this.client});

  static const apiUrl = "https://api.example.com/about";

  @override
  Future<AboutModel> fetchAboutData() async {
    final response = await client.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return AboutModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load about data");
    }
  }
}
