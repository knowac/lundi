import 'package:feature_settings/data/repositories/settings_repository_impl.dart';
import 'package:feature_settings/di/data_source_provider.dart';
import 'package:feature_settings/domain/repositories/abstract_settings_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

@riverpod
AbstractSettingsRepository settingsRepository(Ref ref) {
  final dataSource = ref.watch(
    settingsRepositoryDataSourceProvider,
  );
  return SettingsRepositoryImpl(dataSource: dataSource);
}
