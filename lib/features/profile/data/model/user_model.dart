// features/user/data/models/user_model.dart

import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart'; // This is the generated file

@JsonSerializable() // Add this annotation
class UserModel {
  final String id;
  final String name;
  final String profileImageUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.profileImageUrl,
  });

  // Add the factory constructor for JSON deserialization
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  // Add the method for JSON serialization
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}