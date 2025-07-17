import 'package:feature_settings/data/data_sources/abstract_settings_repository_data_source.dart';
import 'package:feature_settings/domain/repositories/abstract_settings_repository.dart';

class SettingsRepositoryImpl implements AbstractSettingsRepository {
  SettingsRepositoryImpl({required this.dataSource});
  final AbstractSettingsRepositoryDataSource dataSource;

  @override
  Future<void> clearData() async {
    await dataSource.clearData();
  }
}
