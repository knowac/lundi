import 'package:feature_select_poi/data/models/poi_model.dart';

abstract class PoiRepositoryDataSource {
  Future<PoiModel> getPoi(String id);
  Future addPoi({
    required double longitude,
    required double latitude,
  });
  Future deletePoi(String id);
}
