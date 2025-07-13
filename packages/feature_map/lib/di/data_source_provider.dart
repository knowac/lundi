import 'package:feature_map/data/data_sources/poi_repository_data_source.dart';
import 'package:feature_map/data/data_sources/poi_repository_data_source_impl.dart';
import 'package:feature_map/data/models/poi_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_source_provider.g.dart';

@riverpod
Box<PoiModel> poiBox(Ref ref) => Hive.box<PoiModel>('points_of_interest');

@riverpod
PoiRepositoryDataSource poiRepositoryDataSource(Ref ref) =>
    PoiRepositoryDataSourceImpl(ref.read(poiBoxProvider));
