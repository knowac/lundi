import 'package:feature_select_poi/data/data_sources/poi_repository_data_source.dart';
import 'package:feature_select_poi/data/data_sources/poi_repository_data_source_impl.dart';
import 'package:feature_select_poi/data/models/poi_model.dart';
import 'package:feature_select_poi/domain/entities/poi.dart';
import 'package:feature_select_poi/domain/repositories/poi_repository.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'poi_repository_impl.g.dart';

@riverpod
PoiRepository poiRepository(Ref ref) {
  final poiDataSource = ref.watch(poiRepositoryDataSourceProvider);
  return PoiRepositoryImpl(poiDataSource: poiDataSource);
}

class PoiRepositoryImpl implements PoiRepository {
  final PoiRepositoryDataSource poiDataSource;

  PoiRepositoryImpl({required PoiRepositoryDataSource this.poiDataSource});

  @override
  Future addPoi({required double longitude, required double latitude}) async {
    try {
      final poi = await poiDataSource.addPoi(
        longitude: longitude,
        latitude: latitude,
      );
      return poi.toEntity();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deletePoi(String id) async {
    try {
      final poi = await poiDataSource.deletePoi(id);
      return poi.toEntity();
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
}
