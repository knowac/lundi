import 'package:feature_select_poi/data/repositories/poi_repository_impl.dart';
import 'package:feature_select_poi/domain/repositories/poi_repository.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remove_poi.g.dart';

@riverpod
DeletePoiUseCase removePoiUseCase(Ref ref) {
  return DeletePoiUseCase(ref.watch(poiRepositoryProvider));
}

class DeletePoiUseCase {
  final PoiRepository _repository;
  DeletePoiUseCase(this._repository);
  Future call(String id) async {
    await _repository.deletePoi(id);
  }
}
