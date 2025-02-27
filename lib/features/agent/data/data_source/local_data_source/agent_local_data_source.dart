import 'package:nest_finder/features/agent/data/model/agent_model.dart';

abstract class AgentLocalDataSource {
  Future<List<Agent>> getAgents();
  Future<void> cacheAgents(List<Agent> agents);
}