// features/about/data/models/about_model.dart

import 'package:json_annotation/json_annotation.dart';

part 'about_model.g.dart'; // This is the generated file

@JsonSerializable() // Add this annotation
class AboutModel {
  final String appTitle;
  final String appDescription;
  final String mission;
  final String vision;
  final Map<String, dynamic> contactInfo;
  final List<Map<String, dynamic>> socialMediaLinks;

  AboutModel({
    required this.appTitle,
    required this.appDescription,
    required this.mission,
    required this.vision,
    required this.contactInfo,
    required this.socialMediaLinks,
  });

  // Add the factory constructor for JSON deserialization
  factory AboutModel.fromJson(Map<String, dynamic> json) => _$AboutModelFromJson(json);

  // Add the method for JSON serialization
  Map<String, dynamic> toJson() => _$AboutModelToJson(this);
}