import 'package:feature_edit/data/data_source/show_map_data_source_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'region_map_provider.g.dart';

@Riverpod(keepAlive: true)
Widget regionMap(Ref ref) => ShowMapDataSourceImpl().regionMap();
