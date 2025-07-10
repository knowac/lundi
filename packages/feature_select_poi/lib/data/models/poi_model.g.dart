// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PoiModel _$PoiModelFromJson(Map<String, dynamic> json) => _PoiModel(
  id: json['id'] as String,
  longitude: (json['longitude'] as num).toDouble(),
  latitude: (json['latitude'] as num).toDouble(),
);

Map<String, dynamic> _$PoiModelToJson(_PoiModel instance) => <String, dynamic>{
  'id': instance.id,
  'longitude': instance.longitude,
  'latitude': instance.latitude,
};
