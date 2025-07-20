// ignored because it is fake negative
// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/di/feature_map/show_map.dart';
import 'package:shared/di/service_locator.dart';
import 'package:shared/domain/entities/poi.dart';

part 'plan_provider.g.dart';

/// Plan provider
@riverpod
class Plan extends _$Plan {
  @override
  FutureOr<List<Poi>> build() => [];

  /// Fetch plan
  Future<void> fetch() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(ServiceLocator.get<AbstractSharedMap>()).getPois(),
    );
  }

  /// Reorder plan
  Future<void> reorder(int oldIndex, int newIndex) async {
    var updatedIndex = newIndex;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      // TODO(kano): Calculate routes for all points and update times
      if (oldIndex < updatedIndex) {
        updatedIndex -= 1;
      }
      final provider = ServiceLocator.get<AbstractSharedMap>();
      final sharedMap = ref.read(provider);
      var pois = await sharedMap.getPois();
      pois.swap(oldIndex, newIndex);
      pois = pois.asMap().entries.map(
        (poiEntry) {
          final index = poiEntry.key;
          final poi = poiEntry.value;
          return poi.copyWith(ordinal: index);
        },
      ).toList();

      final updatedPois = await sharedMap.updatePois(pois);
    });
  }
}
