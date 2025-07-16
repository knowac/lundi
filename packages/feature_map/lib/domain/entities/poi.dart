import 'package:freezed_annotation/freezed_annotation.dart';

part 'poi.freezed.dart';

@freezed
abstract class Poi with _$Poi {
  factory Poi({
    required String id,
    required double longitude,
    required double latitude,
    required String name,
  }) = _Poi;
  Poi._();
}
