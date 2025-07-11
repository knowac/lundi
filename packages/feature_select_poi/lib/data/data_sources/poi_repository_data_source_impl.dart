import 'package:feature_select_poi/data/data_sources/poi_repository_data_source.dart';
import 'package:feature_select_poi/data/models/poi_model.dart';

class PoiRepositoryDataSourceImpl implements PoiRepositoryDataSource {
  @override
  Future addPoi({
    required double longitude,
    required double latitude,
  }) {
    // TODO: implement addPoi
    throw UnimplementedError();
  }

  @override
  Future deletePoi(String id) {
    // TODO: implement deletePoi
    throw UnimplementedError();
  }

  @override
  Future<PoiModel> getPoi(String id) {
    // TODO: implement getPoi
    throw UnimplementedError();
  }
}
