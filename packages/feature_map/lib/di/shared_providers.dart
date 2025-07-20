import 'package:feature_map/di/repository_provider.dart';
import 'package:feature_map/presentation/widgets/region_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/di/feature_map/show_map.dart';
import 'package:shared/di/service_locator.dart';
import 'package:shared/domain/entities/poi.dart';

part 'shared_providers.g.dart';

@riverpod
Future<void> clearPoiData(Ref ref) =>
    ref.read(poiRepositoryProvider).clearData();

@riverpod
class GetPois extends _$GetPois {
  @override
  FutureOr<List<Poi>> build() => [];
  Future<List<Poi>> fetch() => ref.read(poiRepositoryProvider).getPois();
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
  Future<List<Poi>> getPois() => ref.read(getPoisProvider.notifier).fetch();
  @override
  Future<void> clearPoiData() => ref.read(poiRepositoryProvider).clearData();

  @override
  Future<void> updatePoi(Poi poi) =>
      ref.read(poiRepositoryProvider).updatePoi(poi);

  @override
  Future<List<String>> updatePois(List<Poi> pois) =>
      ref.read(poiRepositoryProvider).updatePois(pois);
}

@riverpod
AbstractSharedMap sharedMap(Ref ref) => SharedMap(ref);

class MapSharedProviders {
  static void init() {
    ServiceLocator.register<AbstractSharedMap>(sharedMapProvider);
  }
}
