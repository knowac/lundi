import 'package:feature_edit/domain/interfaces/show_map_data_source.dart';
import 'package:flutter/material.dart';
import 'package:shared/di/locator.dart';
import 'package:shared/interfaces/show_map.dart';

class ShowMapDataSourceImpl implements ShowMapDataSource {
  @override
  Widget regionMap() => getIt<ShowMap>().regionMap();
}
