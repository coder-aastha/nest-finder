// features/agent/domain/entities/agent_entity.dart

class AgentEntity {
  final int id;
  final String name;
  final String imageUrl;
  final String description;
  final String phone;
  final String email;

  AgentEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.phone,
    required this.email,
  });
}