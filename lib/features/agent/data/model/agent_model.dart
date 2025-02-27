// features/agent/data/models/agent_model.dart

import 'package:json_annotation/json_annotation.dart';

part 'agent_model.g.dart'; // This is the generated file

@JsonSerializable() // Add this annotation
class Agent {
  final int id;
  final String name;
  final String imageUrl;
  final String description;
  final String phone;
  final String email;

  Agent({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.phone,
    required this.email,
  });

  // Add the factory constructor for JSON deserialization
  factory Agent.fromJson(Map<String, dynamic> json) => _$AgentFromJson(json);

  // Add the method for JSON serialization
  Map<String, dynamic> toJson() => _$AgentToJson(this);
}