import 'package:flutter/material.dart';
import 'package:nest_finder/features/property/domain/usecase/property_usecase.dart';
import 'package:nest_finder/features/property/presentation/view/property_listing_page_view.dart';

class PropertyViewModel with ChangeNotifier {
  final GetProperties getProperties;
  final AddProperty addProperty;
  List<Property> _properties = [];

  PropertyViewModel({required this.getProperties, required this.addProperty});

  List<Property> get properties => _properties;

  Future<void> loadProperties() async {
    _properties = await getProperties.call();
    notifyListeners();
  }

  Future<void> addNewProperty(Property property) async {
    await addProperty.call(property);
    _properties.add(property);
    notifyListeners();
  }
}