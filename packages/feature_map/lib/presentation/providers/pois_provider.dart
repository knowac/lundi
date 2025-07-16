import 'package:feature_map/di/usecase_provider.dart';
import 'package:feature_map/domain/entities/poi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
    state = const AsyncValue.loading();

    final addPoiUseCase = ref.read(addPoiUseCaseProvider);

    final result = await AsyncValue.guard(
      () => addPoiUseCase.call(
        longitude: longitude,
        latitude: latitude,
        name: name,
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
  }

  Future<void> deletePoi({
    required String id,
  }) async {
    state = const AsyncValue.loading();

    final removePoiUseCase = ref.read(removePoiUseCaseProvider);

    final result = await AsyncValue.guard(
      () => removePoiUseCase.call(id),
    );
    result.when(
      data: (addedPoiFromUseCase) {
        final currentList = state.valueOrNull ?? []
          ..removeWhere((poi) => poi.id == id);
        state = AsyncValue.data(currentList);
      },
      error: AsyncValue.error,
      loading: AsyncValue.loading,
    );
  }
}
