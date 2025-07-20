import 'package:flutter/material.dart';
import 'package:shared/domain/entities/poi.dart';

abstract class AbstractSharedMap {
  Widget getRegionMap();
  Future<List<Poi>> getPois();
  Future<void> clearPoiData();
  Future<void> updatePoi(Poi poi);
  Future<List<String>> updatePois(List<Poi> pois);
}
