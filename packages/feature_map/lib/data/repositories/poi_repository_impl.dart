import 'package:feature_map/data/data_sources/poi_repository_data_source.dart';
import 'package:feature_map/data/models/poi_model.dart';
import 'package:feature_map/domain/entities/poi.dart';
import 'package:feature_map/domain/repositories/poi_repository.dart';

class PoiRepositoryImpl implements PoiRepository {
  PoiRepositoryImpl({required this.poiDataSource});
  final PoiRepositoryDataSource poiDataSource;

  @override
  Future<void> addPoi({
    required double longitude,
    required double latitude,
    required String name,
  }) async {
    try {
      await poiDataSource.addPoi(
        longitude: longitude,
        latitude: latitude,
        name: name,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deletePoi(String id) async {
    try {
      await poiDataSource.deletePoi(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Poi> getPoi(String id) async {
    try {
      final poi = await poiDataSource.getPoi(id);
      return poi.toEntity();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Poi>> getPois() async {
    try {
      final poi = await poiDataSource.getPois();
      return poi.toEntity();
    } catch (e) {
      rethrow;
    }
  }
}
