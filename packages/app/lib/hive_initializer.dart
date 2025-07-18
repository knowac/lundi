import 'package:feature_map/data/models/poi_model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

Future<void> initializeHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(PoiModelAdapter());

  await Hive.openBox<PoiModel>('points_of_interest');
}
