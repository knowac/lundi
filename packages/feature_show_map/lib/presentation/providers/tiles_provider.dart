import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_map_mbtiles/flutter_map_mbtiles.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tiles_provider.g.dart';

@riverpod
class Tiles extends _$Tiles {
  @override
  Future<MbTilesTileProvider> build() async {
    const tilesAssetPath = 'packages/shared/lib/maps/map.mbtiles';
    final tempDir = await getTemporaryDirectory();
    final tempPath = tempDir.path;
    final tilesPath = '$tempPath/map.mbtiles';

    if (await File(tilesPath).exists()) {
      File(tilesPath).deleteSync();
    }

    if (!await File(tilesPath).exists()) {
      final data = await rootBundle.load(tilesAssetPath);
      final bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );
      await File(tilesPath).writeAsBytes(bytes);
    }

    return MbTilesTileProvider.fromPath(
      path: tilesPath,
      silenceTileNotFound: true,
    );
  }
}
