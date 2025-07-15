// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:feature_map/di/repository_provider.dart';
import 'package:feature_map/domain/use_case/add_poi.dart';
import 'package:feature_map/domain/use_case/get_poi.dart';
import 'package:feature_map/domain/use_case/get_pois.dart';
import 'package:feature_map/domain/use_case/remove_poi.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecase_provider.g.dart';

@riverpod
AddPoiUseCase addPoiUseCase(Ref ref) =>
    AddPoiUseCase(ref.watch(poiRepositoryProvider));

@riverpod
GetPoiUseCase getPoiUseCase(Ref ref) =>
    GetPoiUseCase(ref.watch(poiRepositoryProvider));

@riverpod
GetPoisUseCase getPoisUseCase(Ref ref) =>
    GetPoisUseCase(ref.watch(poiRepositoryProvider));
@riverpod
DeletePoiUseCase removePoiUseCase(Ref ref) =>
    DeletePoiUseCase(ref.watch(poiRepositoryProvider));
