import 'package:feature_map/domain/repositories/poi_repository.dart';
import 'package:shared/domain/entities/poi.dart';

class UpdatePoiUseCase {
  UpdatePoiUseCase(this._repository);
  final AbstractPoiRepository _repository;

  Future<Poi?> call(Poi poi) => _repository.updatePoi(poi);
}
