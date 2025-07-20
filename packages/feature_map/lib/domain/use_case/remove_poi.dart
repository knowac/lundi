import 'package:feature_map/domain/repositories/poi_repository.dart';
import 'package:shared/domain/entities/poi.dart';

class DeletePoiUseCase {
  DeletePoiUseCase(this._repository);
  final AbstractPoiRepository _repository;
  Future<Poi?> call(String id) => _repository.deletePoi(id);
}
