import 'package:nest_finder/features/agent/data/data_source/local_data_source/agent_local_data_source.dart';
import 'package:nest_finder/features/agent/data/data_source/remote_datasource/agent_remote_data.dart';
import 'package:nest_finder/features/agent/data/model/agent_model.dart';


class AgentRepositoryImpl implements AgentRepository {
  final AgentRemoteDataSource remoteDataSource;
  final AgentLocalDataSource localDataSource;

  AgentRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<Agent>> getAgents() async {
    try {
      // Try fetching from remote data source
      final agents = await remoteDataSource.getAgents();
      // Cache the fetched agents
      await localDataSource.cacheAgents(agents);
      return agents;
    } catch (e) {
      // If remote fails, fetch from local data source
      return await localDataSource.getAgents();
    }
  }
}