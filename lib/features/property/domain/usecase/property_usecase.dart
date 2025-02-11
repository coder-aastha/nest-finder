import 'package:nest_finder/features/property/data/repository/remote_repository/property_repository.dart';
import 'package:nest_finder/features/property/presentation/view/property_listing_page_view.dart';

class GetProperties {
  final PropertyRepository repository;

  GetProperties(this.repository, {required repository});

  Future<List<Property>> call() async {
    return await repository.getProperties();
  }
}

class AddProperty {
  final PropertyRepository repository;

  AddProperty(this.repository);

  Future<void> call(Property property) async {
    await repository.addProperty(property);
  }
}