import 'package:feature_select_poi/di/repository_provider.dart';
import 'package:feature_select_poi/domain/use_case/add_poi.dart';
import 'package:feature_select_poi/domain/use_case/get_poi.dart';
import 'package:feature_select_poi/domain/use_case/remove_poi.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecase_provider.g.dart';

@riverpod
AddPoiUseCase addPoiUseCase(Ref ref) {
  return AddPoiUseCase(ref.watch(poiRepositoryProvider));
}

@riverpod
GetPoiUseCase getPoiUseCase(Ref ref) {
  return GetPoiUseCase(ref.watch(poiRepositoryProvider));
}

@riverpod
DeletePoiUseCase removePoiUseCase(Ref ref) {
  return DeletePoiUseCase(ref.watch(poiRepositoryProvider));
}
