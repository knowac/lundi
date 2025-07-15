import 'package:feature_map/domain/entities/poi.dart';
import 'package:feature_map/domain/repositories/poi_repository.dart';

class AddPoiUseCase {
  AddPoiUseCase(this._repository);
  final PoiRepository _repository;

  Future<Poi> call({
    required double longitude,
    required double latitude,
    required String name,
  }) async {
    return await _repository.addPoi(
      longitude: longitude,
      latitude: latitude,
      name: name,
    );
  }
}
