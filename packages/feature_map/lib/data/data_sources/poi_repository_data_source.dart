import 'package:feature_map/data/models/poi_model.dart';

abstract class PoiRepositoryDataSource {
  Future<PoiModel> getPoi(String id);
  Future<List<PoiModel>> getPois();
  Future<PoiModel> addPoi({
    required double longitude,
    required double latitude,
    required String name,
  });
  Future<void> deletePoi(String id);
}
