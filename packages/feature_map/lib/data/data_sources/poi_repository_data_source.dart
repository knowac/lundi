import 'package:feature_map/data/models/poi_model.dart';

abstract class PoiRepositoryDataSource {
  Future<PoiModel> getPoi(String id);
  Future<List<PoiModel>> getPois();
  Future<PoiModel> addPoi({
    required double longitude,
    required double latitude,
    required String name,
    required int ordinal,
    required DateTime? date,
    required String? customName,
  });
  Future<PoiModel?> deletePoi(String id);
  Future<PoiModel?> updatePoi(PoiModel poi);
  Future<List<String>> updatePois(List<PoiModel> pois);
  Future<void> clearData();
}
