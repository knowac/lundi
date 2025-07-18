import 'package:feature_map/data/data_sources/poi_repository_data_source.dart';
import 'package:hive_ce/hive.dart';
import 'package:shared/models/poi_model.dart';
import 'package:uuid/uuid.dart';

class PoiRepositoryDataSourceImpl implements PoiRepositoryDataSource {
  PoiRepositoryDataSourceImpl(this._box);

  final Box<PoiModel> _box;

  @override
  Future<PoiModel> addPoi({
    required double longitude,
    required double latitude,
    required String name,
    required int ordinal,
  }) async {
    final poi = PoiModel(
      id: const Uuid().v4(),
      longitude: longitude,
      latitude: latitude,
      name: name,
      ordinal: ordinal,
    );
    await _box.put(poi.id, poi);
    return poi;
  }

  @override
  Future<PoiModel?> deletePoi(String id) async {
    if (!_box.containsKey(id)) {
      return null;
    }
    final poi = _box.get(id);
    await _box.delete(id);
    return poi;
  }

  @override
  Future<PoiModel> getPoi(String id) => Future.value(_box.get(id));

  @override
  Future<List<PoiModel>> getPois() => Future.value(_box.values.toList());

  @override
  Future<PoiModel?> updatePoi(PoiModel poi) async {
    if (_box.containsKey(poi.id)) {
      await _box.put(poi.id, poi);
      return poi;
    }
    return null;
  }

  @override
  Future<void> clearData() async {
    await _box.clear();
  }
}
