import 'package:shared/domain/entities/poi.dart';

abstract class AbstractPoiRepository {
  Future<Poi> getPoi(String id);
  Future<List<Poi>> getPois();
  Future<Poi> addPoi({
    required double longitude,
    required double latitude,
    required String name,
    required int ordinal,
    required DateTime? date,
    required String? customName,
  });
  Future<Poi?> deletePoi(String id);
  Future<Poi?> updatePoi(Poi poi);
  Future<List<String>> updatePois(List<Poi> pois);
  Future<void> clearData();
}
