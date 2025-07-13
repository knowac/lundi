import 'package:freezed_annotation/freezed_annotation.dart';

part 'poi.freezed.dart';

@freezed
abstract class Poi with _$Poi {
  factory Poi({
    required double longitude,
    required double latitude,
    required String name,
  }) = _Poi;
  Poi._();
}
