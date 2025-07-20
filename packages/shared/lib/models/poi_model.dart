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
    @HiveField(4) required int ordinal,
    @HiveField(5) required DateTime? date,
    @HiveField(6) required String? customName,
  }) = _PoiModel;

  PoiModel._();
  factory PoiModel.fromJson(Map<String, dynamic> json) =>
      _$PoiModelFromJson(json);

  factory PoiModel.dummy({
    required DateTime date,
    required String customName,
  }) => PoiModel(
    id: 'dummy',
    longitude: 0.0,
    latitude: 0.0,
    name: 'Dummy Place',
    ordinal: 0,
    date: date,
    customName: customName,
  );
}
