import 'package:feature_map/domain/entities/poi.dart';
import 'package:shared/models/poi_model.dart';

extension PoiModelX on PoiModel {
  Poi toEntity() => Poi(
    id: id,
    longitude: longitude,
    latitude: latitude,
    name: name,
    ordinal: ordinal,
  );
}

extension PoiX on Poi {
  PoiModel fromEntity() => PoiModel(
    id: id,
    longitude: longitude,
    latitude: latitude,
    name: name,
    ordinal: ordinal,
  );
}

extension PoiListX on List<Poi> {
  List<PoiModel> fromEntity() => map((el) => el.fromEntity()).toList();
}

extension PoiListModelX on List<PoiModel> {
  List<Poi> toEntity() => map((el) => el.toEntity()).toList();
}
