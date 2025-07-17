// Ignored because we want to remove data from all boxes no matter of type.
// ignore_for_file: strict_raw_type

import 'package:feature_settings/data/data_sources/abstract_settings_repository_data_source.dart';
import 'package:hive_ce/hive.dart';
import 'package:shared/models/poi_model.dart';

class SettingsRepositoryDataSourceImpl
    implements AbstractSettingsRepositoryDataSource {
  SettingsRepositoryDataSourceImpl();

  @override
  Future<void> clearData() async {
    await Hive.box<PoiModel>('points_of_interest').clear();
  }
}
