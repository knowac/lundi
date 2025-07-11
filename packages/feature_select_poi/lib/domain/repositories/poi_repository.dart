import 'package:feature_select_poi/domain/entities/poi.dart';

abstract class PoiRepository {
  Future<Poi> getPoi(String id);
  Future addPoi({
    required double longitude,
    required double latitude,
  });
  Future deletePoi(String id);
}
