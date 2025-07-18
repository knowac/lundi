import 'package:feature_map/data/repositories/poi_repository_impl.dart';
import 'package:feature_map/di/data_source_provider.dart';
import 'package:feature_map/domain/repositories/poi_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

@riverpod
AbstractPoiRepository poiRepository(Ref ref) {
  final poiDataSource = ref.watch(poiRepositoryDataSourceProvider);
  return PoiRepositoryImpl(poiDataSource: poiDataSource);
}
