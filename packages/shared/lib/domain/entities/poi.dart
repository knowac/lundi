import 'package:freezed_annotation/freezed_annotation.dart';

part 'poi.freezed.dart';

@freezed
abstract class Poi with _$Poi {
  factory Poi({
    required String id,
    required double longitude,
    required double latitude,
    required String name,
    required int ordinal,
    required DateTime? date,
    required String? customName,
  }) = _Poi;
  Poi._();

  factory Poi.dummy({
    required DateTime date,
    required String customName,
  }) => Poi(
    id: 'dummy',
    longitude: 0.0,
    latitude: 0.0,
    name: 'Dummy Place',
    ordinal: 0,
    date: date,
    customName: customName,
  );
}
