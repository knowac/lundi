library;

import 'package:feature_show_map/presentation/widgets/region_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/interfaces/feature_show_map/widgets/show_map.dart';

part 'shared_providers.g.dart';

/// Provider to show a region map.
@riverpod
ShowMap showRegionMap(Ref ref) =>
    () => const RegionMap();

/// Provider override for [showRegionMap]. It works as dependency injection in
/// riverpod. All overrides should be added to ProviderScope in main.dart.
/// The origin is [getRegionMap] the dummy provider in
/// [package:shared/feature_show_map/widgets/show_map.dart]
final showRegionMapProviderOverride = ProviderOverride(
  origin: getRegionMapProvider,
  override: showRegionMapProvider,
);
