// Ignored because we want to remove data from all boxes no matter of type.
// ignore_for_file: strict_raw_type

import 'package:feature_settings/data/data_sources/abstract_settings_repository_data_source.dart';
import 'package:feature_settings/data/data_sources/settings_repository_data_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_source_provider.g.dart';

@riverpod
AbstractSettingsRepositoryDataSource settingsRepositoryDataSource(Ref ref) =>
    SettingsRepositoryDataSourceImpl();
