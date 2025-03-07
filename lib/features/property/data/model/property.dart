import 'package:json_annotation/json_annotation.dart';

part 'property_model.g.dart'; 

@JsonSerializable() 
class Property {
  final int id;
  final String title;
  final List<String> images;
  final int bedrooms;
  final int bathrooms;
  final double price;
  final String address;
  final double latitude;
  final double longitude;
  final double? size;
  final Map<String, String>? nearbyPlaces;
  final String? description;
  final String? city;
  final bool? isForSale;

  Property({
    required this.id,
    required this.title,
    required this.images,
    required this.bedrooms,
    required this.bathrooms,
    required this.price,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.size,
    this.nearbyPlaces,
    this.description,
    this.city,
    this.isForSale,
  });

  // Add the factory constructor for JSON deserialization
  factory Property.fromJson(Map<String, dynamic> json) => _$PropertyFromJson(json);

  // Add the method for JSON serialization
  Map<String, dynamic> toJson() => _$PropertyToJson(this);
}