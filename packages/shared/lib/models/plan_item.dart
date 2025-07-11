import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_item.freezed.dart';
part 'plan_item.g.dart';

@unfreezed
abstract class PlanItem with _$PlanItem {
  const factory PlanItem({
    required DateTime? date,
    required String place,
  }) = _PlanItem;

  factory PlanItem.fromJson(Map<String, dynamic> json) =>
      _$PlanItemFromJson(json);
}
