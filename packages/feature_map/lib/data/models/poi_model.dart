import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';
import 'package:shared/domain/entities/poi.dart';

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
    @HiveField(4) required int ordinal,
    @HiveField(5) required DateTime? date,
    @HiveField(6) required String? customName,
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
    ordinal: ordinal,
    date: null,
    customName: null,
  );
}

extension PoiX on Poi {
  PoiModel fromEntity() => PoiModel(
    id: id,
    longitude: longitude,
    latitude: latitude,
    name: name,
    ordinal: ordinal,
    date: null,
    customName: '',
  );
}

extension PoiListX on List<Poi> {
  List<PoiModel> fromEntity() => map((el) => el.fromEntity()).toList();
}

extension PoiListModelX on List<PoiModel> {
  List<Poi> toEntity() => map((el) => el.toEntity()).toList();
}
