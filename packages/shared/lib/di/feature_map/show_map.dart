import 'package:flutter/material.dart';
import 'package:shared/models/poi_model.dart';

abstract class AbstractSharedMap {
  Widget getRegionMap();
  Future<List<PoiModel>> getPois();
  Future<void> clearPoiData();
}
