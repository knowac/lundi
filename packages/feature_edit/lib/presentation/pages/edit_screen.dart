import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sliding_box/flutter_sliding_box.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared/di/feature_map/show_map.dart';
import 'package:shared/di/service_locator.dart';
import 'package:shared/generated/l10n.dart';
import 'package:shared/models/poi_model.dart';
import 'package:shared/providers/plan_provider.dart';

/// EditScreen class
class EditScreen extends ConsumerStatefulWidget {
  /// EditScreen constructor
  const EditScreen({super.key});

  @override
  ConsumerState<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends ConsumerState<EditScreen>
    with SingleTickerProviderStateMixin {
  final _boxController = BoxController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      unawaited(ref.read(planProvider.notifier).fetch());
    });
  }

  @override
  void dispose() {
    _boxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    final plan = ref.watch(planProvider);

    final fetchedPlan = plan.maybeWhen(
      orElse: () => <PoiModel>[],
      data: (data) => data,
    );
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: double.infinity,
            color: colorScheme.secondaryContainer,
            child: ref
                .read(ServiceLocator.get<AbstractSharedMap>())
                .getRegionMap(),
          ),
        ),
        SlidingBox(
          style: BoxStyle.sheet,
          minHeight: height * 0.1,
          maxHeight: height * 0.75,
          color: colorScheme.surface,
          draggableIconBackColor: colorScheme.surface,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(32),
          ),
          controller: _boxController,
          collapsed: true,
          animationCurve: Curves.easeInOut,
          bodyBuilder: (scrollController, boxPosition) => Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      S.of(context).editTitle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.agdasima().copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      S.of(context).editExplanation,
                      style: GoogleFonts.roboto().copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              ReorderableListView.builder(
                onReorder: (from, to) {
                  unawaited(
                    ref
                        .read(planProvider.notifier)
                        .reorder(
                          from,
                          to,
                        ),
                  );
                },
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) => Container(
                  key: Key(
                    index.toString(),
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: index == fetchedPlan.length
                      ? null
                      : BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: colorScheme.outline,
                            ),
                          ),
                        ),
                  child: ListTile(
                    minVerticalPadding: 8,
                    minTileHeight: 0,
                    horizontalTitleGap: 8,
                    leading: Text(
                      index.toString(),
                      style: GoogleFonts.roboto().copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    trailing: Icon(
                      Icons.more_vert,
                      color: colorScheme.onSurface,
                    ),
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text(
                      fetchedPlan[index].date?.toString() ?? '',
                      style: GoogleFonts.roboto().copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    subtitle: Text(
                      fetchedPlan[index].customName ?? '',
                      style: GoogleFonts.roboto().copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
                itemCount: plan.maybeWhen(
                  orElse: () => 0,
                  error: (e, st) => 0,
                  data: (data) => data.length,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(color: colorScheme.surface, height: 80),
        ),
      ],
    );
  }
}
