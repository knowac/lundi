import 'package:feature_select_poi/data/data_sources/poi_repository_data_source.dart';
import 'package:feature_select_poi/data/data_sources/poi_repository_data_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_source_provider.g.dart';

@riverpod
PoiRepositoryDataSource poiRepositoryDataSource(Ref ref) {
  return PoiRepositoryDataSourceImpl();
}
