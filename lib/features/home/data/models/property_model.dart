// features/property/data/models/property_model.dart

import 'package:json_annotation/json_annotation.dart';

part 'property_model.g.dart'; // This is the generated file

@JsonSerializable() // Add this annotation
class Property {
  final int id;
  final String title;
  final String location;
  final double price;
  final String imageUrl;

  Property({
    required this.id,
    required this.title,
    required this.location,
    required this.price,
    required this.imageUrl,
  });

  // Add the factory constructor for JSON deserialization
  factory Property.fromJson(Map<String, dynamic> json) => _$PropertyFromJson(json);

  // Add the method for JSON serialization
  Map<String, dynamic> toJson() => _$PropertyToJson(this);
}