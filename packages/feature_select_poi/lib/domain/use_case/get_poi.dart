import 'package:feature_select_poi/domain/repositories/poi_repository.dart';

class GetPoiUseCase {
  final PoiRepository _repository;
  GetPoiUseCase(this._repository);
  Future call(String id) async {
    await _repository.getPoi(id);
  }
}
