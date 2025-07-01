// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlanItem _$PlanItemFromJson(Map<String, dynamic> json) => _PlanItem(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      place: json['place'] as String,
    );

Map<String, dynamic> _$PlanItemToJson(_PlanItem instance) => <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'place': instance.place,
    };
