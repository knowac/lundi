import 'package:shared/models/poi_model.dart';

abstract class PoiRepositoryDataSource {
  Future<PoiModel> getPoi(String id);
  Future<List<PoiModel>> getPois();
  Future<PoiModel> addPoi({
    required double longitude,
    required double latitude,
    required String name,
    required int ordinal,
  });
  Future<PoiModel?> deletePoi(String id);
  Future<PoiModel?> updatePoi(PoiModel poi);
  Future<void> clearData();
}
