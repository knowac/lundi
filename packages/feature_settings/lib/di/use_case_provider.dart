// Just because
// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:feature_settings/di/repository_provider.dart';
import 'package:feature_settings/domain/use_case/clear_data_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'use_case_provider.g.dart';

@riverpod
ClearDataUseCase clearDataUseCase(Ref ref) =>
    ClearDataUseCase(ref.watch(settingsRepositoryProvider));
