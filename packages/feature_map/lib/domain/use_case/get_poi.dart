import 'package:feature_map/domain/entities/poi.dart';
import 'package:feature_map/domain/repositories/poi_repository.dart';

class GetPoiUseCase {
  GetPoiUseCase(this._repository);
  final PoiRepository _repository;
  Future<Poi> call(String id) async => await _repository.getPoi(id);
}
