import 'package:nest_finder/features/agent/domain/entity/agent_entity.dart';

abstract class AgentRepository {
  Future<List<AgentEntity>> getAgents();
}