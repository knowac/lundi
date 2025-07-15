import 'package:feature_map/domain/entities/poi.dart';

abstract class PoiRepository {
  Future<Poi> getPoi(String id);
  Future<List<Poi>> getPois();
  Future<Poi> addPoi({
    required double longitude,
    required double latitude,
    required String name,
  });
  Future<void> deletePoi(String id);
}
