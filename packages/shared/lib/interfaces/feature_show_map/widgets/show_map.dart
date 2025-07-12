import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'show_map.g.dart';

typedef ShowMap = Widget Function();

@riverpod
ShowMap getRegionMap(Ref ref) => throw UnimplementedError();
