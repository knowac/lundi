import 'package:feature_map/domain/repositories/poi_repository.dart';
import 'package:shared/domain/entities/poi.dart';

class GetPoisUseCase {
  GetPoisUseCase(this._repository);
  final AbstractPoiRepository _repository;
  Future<List<Poi>> call() => _repository.getPois();
}
