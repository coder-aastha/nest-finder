import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchResultViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;
  List<Map<String, dynamic>> _results = [];

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<Map<String, dynamic>> get results => _results;

  Future<void> fetchFilteredResults(String minPrice, String maxPrice, String location) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final url = Uri.parse(
        'http://localhost:8800/api/properties?minPrice=$minPrice&maxPrice=$maxPrice&location=$location');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _results = data.map((item) => item as Map<String, dynamic>).toList();
      } else {
        _error = 'Failed to load data (Status: ${response.statusCode})';
      }
    } catch (e) {
      _error = 'Error fetching data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
