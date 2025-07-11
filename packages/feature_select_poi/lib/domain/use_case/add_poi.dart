import 'package:feature_select_poi/data/repositories/poi_repository_impl.dart';
import 'package:feature_select_poi/domain/repositories/poi_repository.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_poi.g.dart';

@riverpod
AddPoiUseCase addPoiUseCase(Ref ref) {
  return AddPoiUseCase(ref.watch(poiRepositoryProvider));
}

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
