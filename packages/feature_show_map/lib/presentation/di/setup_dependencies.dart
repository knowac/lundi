import 'package:shared/di/locator.dart';
import 'package:shared/interfaces/show_map.dart';

import 'feature_show_map_dependencies.dart';

void setupFeatureShowMap() {
  getIt.registerLazySingleton<ShowMap>(() => ShowMapImpl());
}
