import 'package:feature_map/domain/entities/poi.dart';
import 'package:feature_map/domain/repositories/poi_repository.dart';

class GetPoisUseCase {
  GetPoisUseCase(this._repository);
  final PoiRepository _repository;
  Future<List<Poi>> call() => _repository.getPois();
}
