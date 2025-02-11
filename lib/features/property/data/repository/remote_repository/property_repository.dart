import 'package:nest_finder/features/property/data/data_source/remote_datasource/property_remote_datasource.dart';
import 'package:nest_finder/features/property/presentation/view/property_listing_page_view.dart';

abstract class PropertyRepository {
  Future<List<Property>> getProperties();
  Future<void> addProperty(Property property);
}

class PropertyRepositoryImpl implements PropertyRepository {
  final RemoteDataSource remoteDataSource;

  PropertyRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Property>> getProperties() async {
    return await remoteDataSource.getProperties();
  }

  @override
  Future<void> addProperty(Property property) async {
    await remoteDataSource.addProperty(property);
  }
}