library;

import 'package:feature_show_map/presentation/widgets/region_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/interfaces/feature_show_map/widgets/show_map.dart';

part 'shared_providers.g.dart';

@riverpod
ShowMap showRegionMap(Ref ref) =>
    () => const RegionMap();

final showRegionMapProviderOverride = ProviderOverride(
  origin: getRegionMapProvider,
  override: showRegionMapProvider,
);
