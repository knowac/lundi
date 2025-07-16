import 'package:feature_map/domain/entities/poi.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'poi_model.freezed.dart';
part 'poi_model.g.dart';

@freezed
abstract class PoiModel extends HiveObject with _$PoiModel {
  @HiveType(typeId: 0)
  factory PoiModel({
    @HiveField(0) required String id,
    @HiveField(1) required double longitude,
    @HiveField(2) required double latitude,
    @HiveField(3) required String name,
  }) = _PoiModel;

  PoiModel._();
  factory PoiModel.fromJson(Map<String, dynamic> json) =>
      _$PoiModelFromJson(json);
}

extension PoiModelX on PoiModel {
  Poi toEntity() => Poi(
    id: id,
    longitude: longitude,
    latitude: latitude,
    name: name,
  );
}

extension PoiListModelX on List<PoiModel> {
  List<Poi> toEntity() => map((el) => el.toEntity()).toList();
}
