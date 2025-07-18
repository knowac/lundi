import 'package:feature_map/di/repository_provider.dart';
import 'package:feature_map/presentation/widgets/region_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/di/feature_map/show_map.dart';

part 'shared_providers.g.dart';

@riverpod
Future<void> clearPoiData(Ref ref) =>
    ref.read(poiRepositoryProvider).clearData();

final clearPoiDataProviderOverride = ProviderOverride(
  origin: dummyClearPoiDataProvider,
  override: clearPoiDataProvider,
);

/// Provider to show a region map.
@riverpod
Widget showRegionMap(Ref ref) => const RegionMap();

/// Provider override for [showRegionMap]. It works as dependency injection in
/// riverpod. All overrides should be added to ProviderScope in main.dart.
/// The origin is [getRegionMap] the dummy provider in
/// [package:shared/feature_map/widgets/show_map.dart]
final showRegionMapProviderOverride = ProviderOverride(
  origin: getRegionMapProvider,
  override: showRegionMapProvider,
);
