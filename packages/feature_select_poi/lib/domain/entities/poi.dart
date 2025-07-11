import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'poi.freezed.dart';

@freezed
abstract class Poi extends HiveObject with _$Poi {
  Poi._();
  @HiveType(typeId: 0)
  factory Poi({
    @HiveField(0) required String id,
    @HiveField(1) required double longitude,
    @HiveField(2) required double latitude,
  }) = _Poi;
}
