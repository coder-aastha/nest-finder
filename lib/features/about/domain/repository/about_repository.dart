import 'package:nest_finder/features/about/domain/entity/about_entity.dart';


abstract class AboutRepository {
  Future<AboutEntity> getAboutData();
}
