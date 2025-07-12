import 'package:feature_map/domain/repositories/poi_repository.dart';

class AddPoiUseCase {
  AddPoiUseCase(this._repository);
  final PoiRepository _repository;

  Future<void> call({
    required double longitude,
    required double latitude,
  }) async {
    await _repository.addPoi(
      longitude: longitude,
      latitude: latitude,
    );
  }
}
