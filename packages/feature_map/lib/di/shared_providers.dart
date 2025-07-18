import 'package:feature_map/data/models/poi_model.dart';
import 'package:feature_map/di/repository_provider.dart';
import 'package:feature_map/presentation/widgets/region_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/di/feature_map/show_map.dart';
import 'package:shared/di/service_locator.dart';
import 'package:shared/models/poi_model.dart';

part 'shared_providers.g.dart';

@riverpod
Future<void> clearPoiData(Ref ref) =>
    ref.read(poiRepositoryProvider).clearData();

@riverpod
class GetPois extends _$GetPois {
  @override
  FutureOr<List<PoiModel>> build() => [];
  Future<List<PoiModel>> fetch() => ref
      .read(poiRepositoryProvider)
      .getPois()
      .then(
        (pois) => pois
            .map(
              (poi) => poi.fromEntity(),
            )
            .toList(),
      );
}

/// Provider to show a region map.
@riverpod
Widget getRegionMap(Ref ref) => const RegionMap();

class SharedMap implements AbstractSharedMap {
  SharedMap(this.ref);
  Ref ref;
  @override
  Widget getRegionMap() => ref.read(getRegionMapProvider);
  @override
  Future<List<PoiModel>> getPois() =>
      ref.read(getPoisProvider.notifier).fetch();
  @override
  Future<void> clearPoiData() => ref.read(poiRepositoryProvider).clearData();
}

@riverpod
AbstractSharedMap sharedMap(Ref ref) => SharedMap(ref);

class MapSharedProviders {
  static void init() {
    ServiceLocator.register<AbstractSharedMap>(sharedMapProvider);
  }
}
