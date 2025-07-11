import 'package:feature_show_map/presentation/di/feature_show_map_dependencies.dart';
import 'package:shared/di/locator.dart';
import 'package:shared/interfaces/show_map.dart';

/// Setup feature show map
void setupFeatureShowMap() {
  getIt.registerLazySingleton<ShowMap>(ShowMapImpl.new);
}
