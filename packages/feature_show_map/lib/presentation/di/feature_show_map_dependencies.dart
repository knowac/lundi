import 'package:feature_show_map/presentation/widgets/region_map.dart';
import 'package:flutter/material.dart';
import 'package:shared/interfaces/show_map.dart';

class ShowMapImpl implements ShowMap {
  @override
  Widget regionMap() {
    return RegionMap();
  }
}
