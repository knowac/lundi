import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/di/feature_map/show_map.dart';
import 'package:shared/di/service_locator.dart';
import 'package:shared/models/plan_item.dart';
import 'package:shared/models/poi_model.dart';

part 'plan_provider.g.dart';

/// Plan provider
@riverpod
class Plan extends _$Plan {
  @override
  FutureOr<List<PlanItem>> build() => [];

  /// Fetch plan
  Future<void> fetch() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async =>
          (await ref.read(ServiceLocator.get<AbstractSharedMap>()).getPois())
              .map((poi) => poi.toPlanItem())
              .toList(),
    );
  }

  /// Reorder plan
  Future<void> reorder(int oldIndex, int newIndex) async {
    // var updatedIndex = newIndex;
    // state = const AsyncLoading();
    // state = await AsyncValue.guard(() async {
    //   // TODO(kano): Calculate routes for all points and update times
    //   if (oldIndex < updatedIndex) {
    //     updatedIndex -= 1;
    //   }
    //   final item = _plan.removeAt(oldIndex);
    //   _plan.insert(updatedIndex, item);
    //   return _plan;
    // });
  }
}

extension PlanExtension on PoiModel {
  PlanItem toPlanItem() => PlanItem(
    date: DateTime.now(),
    place: ordinal.toString(),
  );
}
