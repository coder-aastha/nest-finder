import 'package:nest_finder/features/agent/data/model/agent_model.dart';


abstract class AgentRemoteDataSource {
  Future<List<Agent>> getAgents();
}