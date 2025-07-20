import 'package:flutter/material.dart';
import 'package:shared/domain/entities/poi.dart';

abstract class AbstractSharedMap {
  Widget getRegionMap();
  Future<List<Poi>> getPois();
  Future<void> clearPoiData();
}
