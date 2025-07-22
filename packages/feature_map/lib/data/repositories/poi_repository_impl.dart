import 'package:feature_map/data/data_sources/poi_repository_data_source.dart';
import 'package:feature_map/data/models/poi_model.dart';
import 'package:feature_map/domain/repositories/poi_repository.dart';
import 'package:shared/domain/entities/poi.dart';

class PoiRepositoryImpl implements AbstractPoiRepository {
  PoiRepositoryImpl({required this.poiDataSource});
  final PoiRepositoryDataSource poiDataSource;

  @override
  Future<Poi> addPoi({
    required double longitude,
    required double latitude,
    required String name,
    required int ordinal,
    required DateTime? date,
    required String? customName,
  }) async {
    try {
      final poi = await poiDataSource.addPoi(
        longitude: longitude,
        latitude: latitude,
        name: name,
        ordinal: ordinal,
        date: date,
        customName: customName,
      );
      return poi.toEntity();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Poi?> deletePoi(String id) async {
    try {
      final poi = await poiDataSource.deletePoi(id);
      return poi?.toEntity();
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
      final pois = await poiDataSource.getPois();
      return pois.toEntity();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Poi?> updatePoi(Poi poi) async {
    try {
      final poiModel = await poiDataSource.updatePoi(poi.fromEntity());
      return poiModel?.toEntity();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> clearData() async {
    try {
      await poiDataSource.clearData();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Poi>> updatePois(
    List<Poi> pois,
  ) async {
    try {
      final result = await poiDataSource.updatePois(
        pois.fromEntity(),
      );
      return result.toEntity();
    } catch (e) {
      rethrow;
    }
  }
}
