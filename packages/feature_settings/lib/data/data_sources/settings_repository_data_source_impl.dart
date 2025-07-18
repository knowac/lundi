// Ignored because we want to remove data from all boxes no matter of type.
// ignore_for_file: strict_raw_type

import 'package:feature_settings/data/data_sources/abstract_settings_repository_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared/di/feature_map/show_map.dart';

class SettingsRepositoryDataSourceImpl
    implements AbstractSettingsRepositoryDataSource {
  SettingsRepositoryDataSourceImpl(this.ref);

  final Ref ref;
  @override
  Future<void> clearData() async => await ref.read(dummyClearPoiDataProvider);
}
