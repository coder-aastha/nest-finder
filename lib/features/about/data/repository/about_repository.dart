import 'package:nest_finder/features/about/data/data_source/local_data_source/about_local_datasource.dart';
import 'package:nest_finder/features/about/data/data_source/remote_data_source/about_remote_data_source.dart';
import 'package:nest_finder/features/about/domain/entity/about_entity.dart';
import 'package:nest_finder/features/about/domain/repository/about_repository.dart';

class AboutRepositoryImpl implements AboutRepository {
  final AboutRemoteDataSource remoteDataSource;
  final AboutLocalDataSource localDataSource;

  AboutRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<AboutEntity> getAboutData() async {
    try {
      final remoteData = await remoteDataSource.fetchAboutData();
      await localDataSource.cacheAboutData(remoteData);
      return remoteData;
    } catch (_) {
      final localData = await localDataSource.getCachedAboutData();
      if (localData != null) {
        return localData;
      }
      throw Exception("No data available");
    }
  }
}
