import 'package:feature_map/domain/entities/poi.dart';
import 'package:feature_map/domain/repositories/poi_repository.dart';

class UpdatePoiUseCase {
  UpdatePoiUseCase(this._repository);
  final AbstractPoiRepository _repository;

  Future<Poi?> call(Poi poi) => _repository.updatePoi(poi);
}
