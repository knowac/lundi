import 'package:feature_map/domain/entities/poi.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'poi_model.freezed.dart';
part 'poi_model.g.dart';

@freezed
abstract class PoiModel extends HiveObject with _$PoiModel {
  @HiveType(typeId: 0)
  factory PoiModel({
    @HiveField(0) required double longitude,
    @HiveField(1) required double latitude,
    @HiveField(2) required String name,
  }) = _PoiModel;

  PoiModel._();
  factory PoiModel.fromJson(Map<String, dynamic> json) =>
      _$PoiModelFromJson(json);
}

extension PoiModelX on PoiModel {
  Poi toEntity() => Poi(
    longitude: longitude,
    latitude: latitude,
    name: name,
  );
}
