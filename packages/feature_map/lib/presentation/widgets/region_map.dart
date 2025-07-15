import 'package:feature_map/presentation/providers/pois_provider.dart';
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
  Widget build(BuildContext context) {
    final pois = ref.watch(poisProvider);
    final tiles = ref.watch(tilesProvider);
    return tiles.maybeWhen(
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
                  .read(poisProvider.notifier)
                  .addPoi(
                    longitude: point.longitude,
                    latitude: point.latitude,
                    name: 'dummyName', // TODO(kano): add name
                  ),
            ),
            mapController: _mapController,
            children: [
              TileLayer(tileProvider: mbTilesProvider),
              MarkerLayer(
                markers: pois.maybeWhen(
                  orElse: () => [],
                  error: (error, stackTrace) => [],
                  data: (pois) => pois
                      .map(
                        (poi) => Marker(
                          width: 80,
                          height: 80,
                          point: LatLng(
                            poi.latitude,
                            poi.longitude,
                          ),
                          child: Icon(
                            Icons.location_on,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2,
            right: 16,
            child: FloatingActionButton(
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
          ),
        ],
      ),
      loading: CircularProgressIndicator.new,
    );
  }
}
