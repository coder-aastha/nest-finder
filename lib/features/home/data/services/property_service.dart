import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/property_model.dart';

class PropertyService {
  final String baseUrl = 'http://localhost:8800/api/properties';

  Future<List<Property>> fetchProperties({bool isBuy = true}) async {
    final response = await http.get(Uri.parse('$baseUrl?type=${isBuy ? "buy" : "rent"}'));
    if (response.statusCode == 200) {
      final List jsonData = json.decode(response.body);
      return jsonData.map((item) => Property.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load properties');
    }
  }
}
