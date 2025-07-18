import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:shared/models/poi_model.dart';

Future<void> initializeHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(PoiModelAdapter());

  await Hive.openBox<PoiModel>('points_of_interest');
}
