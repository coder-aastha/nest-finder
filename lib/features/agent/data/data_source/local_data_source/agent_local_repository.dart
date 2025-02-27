import 'package:nest_finder/features/agent/data/data_source/local_data_source/agent_local_data_source.dart';
import 'package:nest_finder/features/agent/data/model/agent_model.dart';

class AgentLocalDataSourceImpl implements AgentLocalDataSource {
  @override
  Future<List<Agent>> getAgents() async {
    // Fetch agents from local storage (e.g., SQLite, Hive)
    throw UnimplementedError();
  }

  @override
  Future<void> cacheAgents(List<Agent> agents) async {
    // Cache agents in local storage
    throw UnimplementedError();
  }
}