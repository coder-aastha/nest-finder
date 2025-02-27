import 'package:nest_finder/features/agent/data/data_source/remote_datasource/agent_remote_data.dart';
import 'package:nest_finder/features/agent/data/model/agent_model.dart';

class AgentRemoteDataSourceImpl implements AgentRemoteDataSource {
  @override
  Future<List<Agent>> getAgents() async {
    // Fetch agents from an API
    throw UnimplementedError();
  }
}