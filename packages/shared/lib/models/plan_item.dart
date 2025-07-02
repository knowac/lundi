import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_item.freezed.dart';
part 'plan_item.g.dart';

@unfreezed
abstract class PlanItem with _$PlanItem {
  const factory PlanItem({
    required final DateTime? date,
    required final String place,
  }) = _PlanItem;

  factory PlanItem.fromJson(Map<String, dynamic> json) =>
      _$PlanItemFromJson(json);
}
