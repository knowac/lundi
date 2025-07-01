import 'package:lundi/models/plan_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'plan_provider.g.dart';

@riverpod
class Plan extends _$Plan {
  final List<PlanItem> _plan = [
    PlanItem(
      date: DateTime.parse('2024-06-10'),
      place: 'Reykjavik',
    ),
    PlanItem(
      date: DateTime.parse('2024-06-11'),
      place: 'Thingvellir',
    ),
    PlanItem(
      date: DateTime.parse('2024-06-12'),
      place: 'Hengifoss',
    ),
    PlanItem(
      date: DateTime.parse('2024-06-13'),
      place: 'Skogafoss',
    ),
    PlanItem(
      date: DateTime.parse('2024-06-14'),
      place: 'Thakgil',
    ),
    PlanItem(
      date: DateTime.parse('2024-06-15'),
      place: 'Jokulsarlon',
    ),
  ];
  @override
  FutureOr<List<PlanItem>> build() async {
    return Future.value(_plan);
  }

  void fetch() async {
    state = AsyncLoading();
    state = AsyncValue.data(_plan);
  }

  void reorder(int oldIndex, int newIndex) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      // TODO Calculate routes for all points and update times
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final item = _plan.removeAt(oldIndex);
      _plan.insert(newIndex, item);
      return _plan;
    });
  }
}
