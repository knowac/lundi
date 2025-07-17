import 'package:feature_settings/domain/repositories/abstract_settings_repository.dart';

class ClearDataUseCase {
  ClearDataUseCase(this._repository);
  final AbstractSettingsRepository _repository;

  Future<void> call() async {
    await _repository.clearData();
  }
}
