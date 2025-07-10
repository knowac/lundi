import 'package:freezed_annotation/freezed_annotation.dart';

part 'poi_model.freezed.dart';
part 'poi_model.g.dart';

@freezed
abstract class PoiModel with _$PoiModel {
  const factory PoiModel({
    required String id,
    required double longitude,
    required double latitude,
  }) = _PoiModel;
  factory PoiModel.fromJson(Map<String, dynamic> json) =>
      _$PoiModelFromJson(json);
}
