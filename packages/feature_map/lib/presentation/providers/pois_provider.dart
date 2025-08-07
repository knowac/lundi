// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:feature_map/di/usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/domain/entities/poi.dart';
import 'package:shared/providers/data_updated_provider.dart';

part 'pois_provider.g.dart';

@riverpod
class Pois extends _$Pois {
  @override
  FutureOr<List<Poi>> build() {
    final getPoisUseCase = ref.read(getPoisUseCaseProvider);
    return getPoisUseCase.call();
  }

  Future<void> addPoi({
    required double longitude,
    required double latitude,
    required String name,
  }) async {
    try {
      state = const AsyncValue.loading();

      final previousStateValue = state.valueOrNull ?? [];
      final newOrdinal = previousStateValue.length;

      final addPoiUseCase = ref.read(addPoiUseCaseProvider);

      final result = await AsyncValue.guard(
        () => addPoiUseCase.call(
          longitude: longitude,
          latitude: latitude,
          name: name,
          ordinal: newOrdinal,
          date: DateTime.now(),
          customName: 'point: $newOrdinal',
        ),
      );
      result.when(
        data: (addedPoiFromUseCase) {
          final currentList = state.valueOrNull ?? [];
          state = AsyncValue.data([...currentList, addedPoiFromUseCase]);
        },
        error: AsyncValue.error,
        loading: AsyncValue.loading,
      );
    } finally {
      ref.read(dataUpdatedProvider.notifier).notify();
    }
  }

  Future<void> deletePoi({
    required String id,
  }) async {
    state = const AsyncValue.loading();
    final previousList = state.valueOrNull ?? [];

    final removePoiUseCase = ref.read(removePoiUseCaseProvider);
    final updatePoiUseCase = ref.read(updatePoiUseCaseProvider);

    final result = await AsyncValue.guard(
      () async {
        final removedPoi = await removePoiUseCase.call(id);
        if (removedPoi != null) {
          final larger = previousList.where(
            (poi) => poi.ordinal > removedPoi.ordinal,
          );
          await Future.forEach(larger, (poi) async {
            poi = poi.copyWith(ordinal: poi.ordinal - 1);
            await updatePoiUseCase.call(poi);
          });
          return removedPoi;
        }
        return null;
      },
    );
    result.when(
      data: (removedPoiFromUseCase) {
        try {
          final currentList = state.valueOrNull ?? []
            ..removeWhere((poi) => poi.id == id);
          if (removedPoiFromUseCase != null) {
            final modifiedCurrentList = currentList.map(
              (poi) {
                if (poi.ordinal > removedPoiFromUseCase.ordinal) {
                  return poi.copyWith(ordinal: poi.ordinal - 1);
                }
                return poi;
              },
            ).toList();
            state = AsyncValue.data(modifiedCurrentList);
            return;
          }
          state = AsyncValue.data(currentList);
        } finally {
          ref.read(dataUpdatedProvider.notifier).notify();
        }
      },
      error: AsyncValue.error,
      loading: AsyncValue.loading,
    );
  }
}
