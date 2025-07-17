import 'package:feature_map/domain/entities/poi.dart';
import 'package:shared/models/poi_model.dart';

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
