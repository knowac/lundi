import 'package:feature_map/di/usecase_provider.dart';
import 'package:feature_map/presentation/providers/tiles_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class RegionMap extends ConsumerStatefulWidget {
  const RegionMap({super.key});

  @override
  ConsumerState<RegionMap> createState() => _RegionMapState();
}

class _RegionMapState extends ConsumerState<RegionMap> {
  static const _initialCenter = LatLng(64.9631, -19.0208);
  static const _initialZoom = 7.0;

  @override
  void initState() {
    _mapController = MapController();
    super.initState();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  late MapController _mapController;

  @override
  Widget build(BuildContext context) => ref
      .watch(tilesProvider)
      .maybeWhen(
        orElse: () => const Placeholder(),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        data: (mbTilesProvider) => Stack(
          alignment: Alignment.bottomRight,
          clipBehavior: Clip.none,
          children: [
            FlutterMap(
              options: MapOptions(
                initialCenter: _initialCenter,
                initialZoom: _initialZoom,
                maxZoom: 12,
                minZoom: _initialZoom,
                onTap: (tapPosition, point) => ref
                    .read(addPoiUseCaseProvider)
                    .call(
                      longitude: point.latitude,
                      latitude: point.longitude,
                      name: 'dummyName', //TODOadd name
                    ),
              ),
              mapController: _mapController,
              children: [
                TileLayer(tileProvider: mbTilesProvider),
                const MarkerLayer(
                  markers: [],
                ),
              ],
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.2,
              right: 16,
              height: 40,
              width: 40,
              child: Column(
                children: [
                  FloatingActionButton(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    onPressed: () {
                      _mapController.moveAndRotate(
                        _initialCenter,
                        _initialZoom,
                        0,
                      );
                    },
                    child: const Icon(
                      Icons.explore,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        loading: CircularProgressIndicator.new,
      );
}
