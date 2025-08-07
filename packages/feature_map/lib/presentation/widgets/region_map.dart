import 'package:feature_map/presentation/providers/pois_provider.dart';
import 'package:feature_map/presentation/providers/tiles_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared/providers/data_cleared_provider.dart';
import 'package:shared/providers/data_updated_provider.dart';

/// RegionMap class - Widget displaying the Map of the region
class RegionMap extends ConsumerStatefulWidget {
  /// RegionMap constructor
  const RegionMap({super.key});

  @override
  ConsumerState<RegionMap> createState() => _RegionMapState();
}

class _RegionMapState extends ConsumerState<RegionMap> {
  static const _initialZoom = 7.1;

  static final _icelandBounds = LatLngBounds(
    const LatLng(62.4, -24.6),
    const LatLng(66.8, -13.4),
  );

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

  void _dataChangedReceiver(prev, next) {
    if (prev != next) {
      ref.invalidate(poisProvider);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pois = ref.watch(poisProvider);
    final tiles = ref.watch(tilesProvider);
    ref
      ..listen(dataClearedProvider, _dataChangedReceiver)
      ..listen(dataUpdatedProvider, _dataChangedReceiver);
    return tiles.maybeWhen(
      orElse: () => const Placeholder(),
      error: (error, stackTrace) => Center(
        child: Text(
          error.toString(),
        ),
      ),
      data: (mbTilesProvider) => Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: _icelandBounds.center,
              initialZoom: _initialZoom,
              maxZoom: 12,
              minZoom: _initialZoom,
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
              ),
              // TODO(kano): Check if you can find solution for rotation crash
              // TODO(kano): when we are in min zoom and next to bottom border.
              cameraConstraint: CameraConstraint.contain(
                bounds: _icelandBounds,
              ),
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
                          alignment: Alignment.topCenter,
                          height: 64,
                          width: 50,
                          point: LatLng(
                            poi.latitude,
                            poi.longitude,
                          ),
                          child: GestureDetector(
                            onTap: () async {
                              await ref
                                  .read(poisProvider.notifier)
                                  .deletePoi(
                                    id: poi.id,
                                  );
                            },
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(
                                    2,
                                  ),
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.primary.withAlpha(128),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    poi.ordinal.toString(),
                                    style: GoogleFonts.roboto().copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.surface,
                                    ),
                                  ),
                                ),
                                Icon(
                                  size: 40,
                                  Icons.location_on,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.primary,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.1,
                left: 8,
                child: RichAttributionWidget(
                  alignment: AttributionAlignment.bottomLeft,
                  showFlutterMapAttribution: false,
                  popupInitialDisplayDuration: const Duration(seconds: 1),
                  popupBackgroundColor: Theme.of(
                    context,
                  ).colorScheme.primary.withAlpha(128),
                  attributions: const [
                    TextSourceAttribution('OpenStreetMap'),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: (MediaQuery.of(context).size.height * 0.1) + 16,
            right: 8,
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              onPressed: () {
                _mapController.moveAndRotate(
                  _icelandBounds.center,
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
