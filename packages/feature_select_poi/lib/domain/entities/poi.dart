import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/interfaces/models/i_poi.dart';

part 'poi.freezed.dart';

@freezed
class Poi with _$Poi implements IPoi {
  Poi(this.id, this.longitude, this.latitude);

  @override
  double latitude;

  @override
  double longitude;

  String id;
}
