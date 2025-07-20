import 'package:feature_map/domain/repositories/poi_repository.dart';
import 'package:shared/domain/entities/poi.dart';

class AddPoiUseCase {
  AddPoiUseCase(this._repository);
  final AbstractPoiRepository _repository;

  Future<Poi> call({
    required double longitude,
    required double latitude,
    required String name,
    required int ordinal,
  }) => _repository.addPoi(
    longitude: longitude,
    latitude: latitude,
    name: name,
    ordinal: ordinal,
  );
}
