// Just because
// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';

import 'package:feature_settings/di/use_case_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/providers/data_cleared_provider.dart';

part 'settings_provider.g.dart';

@riverpod
class Settings extends _$Settings {
  @override
  FutureOr<void> build() => Future.value();

  Future<void> clearData() async {
    state = const AsyncValue.loading();
    try {
      await ref.read(clearDataUseCaseProvider).call();
      state = const AsyncData(null);
    } on Exception catch (e, st) {
      state = AsyncError(e, st);
    } finally {
      ref.read(dataClearedProvider.notifier).notify();
    }
  }
}
