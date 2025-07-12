import 'package:feature_map/domain/entities/poi.dart';

abstract class PoiRepository {
  Future<Poi> getPoi(String id);
  Future<void> addPoi({
    required double longitude,
    required double latitude,
  });
  Future<void> deletePoi(String id);
}
