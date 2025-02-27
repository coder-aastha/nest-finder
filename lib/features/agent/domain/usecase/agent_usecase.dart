import 'package:nest_finder/features/agent/domain/entity/agent_entity.dart';
import 'package:nest_finder/features/agent/domain/repository/agent_repository.dart';


class GetAgents {
  final AgentRepository repository;

  GetAgents(this.repository);

  Future<List<AgentEntity>> call() async {
    return await repository.getAgents();
  }
}
