import 'package:feature_select_poi/domain/repositories/poi_repository.dart';

class AddPoiUseCase {
  final PoiRepository _repository;
  AddPoiUseCase(this._repository);
  Future call({
    required double longitude,
    required double latitude,
  }) async {
    await _repository.addPoi(longitude: longitude, latitude: latitude);
  }
}
