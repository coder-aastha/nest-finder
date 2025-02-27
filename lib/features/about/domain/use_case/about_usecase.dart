import 'package:nest_finder/features/about/domain/entity/about_entity.dart';
import 'package:nest_finder/features/about/domain/repository/about_repository.dart';

class GetAboutUseCase {
  final AboutRepository repository;

  GetAboutUseCase({required this.repository});

  Future<AboutEntity> execute() async {
    return await repository.getAboutData();
  }
}
