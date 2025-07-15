import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/models/plan_item.dart';

part 'plan_provider.g.dart';

/// Plan provider
@riverpod
class Plan extends _$Plan {
  final _plan = <PlanItem>[
    PlanItem(date: DateTime.parse('2024-06-10'), place: 'Reykjavik'),
    PlanItem(date: DateTime.parse('2024-06-11'), place: 'Thingvellir'),
    PlanItem(date: DateTime.parse('2024-06-12'), place: 'Hengifoss'),
    PlanItem(date: DateTime.parse('2024-06-13'), place: 'Skogafoss'),
    PlanItem(date: DateTime.parse('2024-06-14'), place: 'Thakgil'),
    PlanItem(date: DateTime.parse('2024-06-15'), place: 'Jokulsarlon'),
  ];

  @override
  FutureOr<List<PlanItem>> build() => Future.value(_plan);

  /// Fetch plan
  void fetch() {
    state = const AsyncLoading();
    state = AsyncValue.data(_plan);
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
      final item = _plan.removeAt(oldIndex);
      _plan.insert(updatedIndex, item);
      return _plan;
    });
  }
}
