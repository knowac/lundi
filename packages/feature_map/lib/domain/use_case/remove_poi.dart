import 'package:feature_map/domain/repositories/poi_repository.dart';

class DeletePoiUseCase {
  DeletePoiUseCase(this._repository);
  final PoiRepository _repository;
  Future<void> call(String id) async {
    await _repository.deletePoi(id);
  }
}
