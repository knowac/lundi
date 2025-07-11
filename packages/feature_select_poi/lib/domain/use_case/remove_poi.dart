import 'package:feature_select_poi/domain/repositories/poi_repository.dart';

class DeletePoiUseCase {
  final PoiRepository _repository;
  DeletePoiUseCase(this._repository);
  Future call(String id) async {
    await _repository.deletePoi(id);
  }
}
