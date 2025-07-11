import 'package:feature_select_poi/data/repositories/poi_repository_impl.dart';
import 'package:feature_select_poi/domain/repositories/poi_repository.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_poi.g.dart';

@riverpod
GetPoiUseCase getPoiUseCase(Ref ref) {
  return GetPoiUseCase(ref.watch(poiRepositoryProvider));
}

class GetPoiUseCase {
  final PoiRepository _repository;
  GetPoiUseCase(this._repository);
  Future call(String id) async {
    await _repository.getPoi(id);
  }
}
