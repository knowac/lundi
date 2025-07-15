import 'package:feature_map/data/data_sources/poi_repository_data_source.dart';
import 'package:feature_map/data/models/poi_model.dart';
import 'package:hive_ce/hive.dart';

class PoiRepositoryDataSourceImpl implements PoiRepositoryDataSource {
  PoiRepositoryDataSourceImpl(this._box);

  final Box<PoiModel> _box;

  @override
  Future<PoiModel> addPoi({
    required double longitude,
    required double latitude,
    required String name,
  }) async {
    final poi = PoiModel(
      longitude: longitude,
      latitude: latitude,
      name: name,
    );
    await _box.add(poi);
    return poi;
  }

  @override
  Future<void> deletePoi(String id) async {
    await _box.delete(id);
  }

  @override
  Future<PoiModel> getPoi(String id) => Future.value(_box.get(id));

  @override
  Future<List<PoiModel>> getPois() => Future.value(_box.values.toList());
}
