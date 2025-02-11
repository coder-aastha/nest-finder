import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nest_finder/features/property/presentation/view/property_listing_page_view.dart';

abstract class RemoteDataSource {
  Future<List<Property>> getProperties();
  Future<void> addProperty(Property property);
}

class PropertyRemoteDataSource implements RemoteDataSource {
  final String baseUrl = 'http://localhost:8800/api/property';
  final http.Client client;

  PropertyRemoteDataSource({required this.client});

  @override
  Future<List<Property>> getProperties() async {
    final response = await client.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Property.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load properties');
    }
  }

  @override
  Future<void> addProperty(Property property) async {
    final response = await client.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(property.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add property');
    }
  }
}