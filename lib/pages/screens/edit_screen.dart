import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sliding_box/flutter_sliding_box.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lundi/config/route_names.dart';
import 'package:lundi/generated/l10n.dart';
import 'package:lundi/models/plan_item.dart';
import 'package:lundi/providers/plan_provider.dart';

class EditScreen extends ConsumerStatefulWidget {
  const EditScreen({
    super.key,
  });

  @override
  ConsumerState<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends ConsumerState<EditScreen>
    with SingleTickerProviderStateMixin {
  final BoxController _boxController = BoxController();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.read(planProvider.notifier).fetch();
    });
  }

  @override
  void dispose() {
    _boxController.dispose();
    super.dispose();
  }

  List<PlanItem> _plan = [];
  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<List<PlanItem>>>(
      planProvider,
      (previous, next) {
        next.whenOrNull(
          error: (o, e) {
            GoRouter.of(context).pushNamed(RouteNames.home);
          },
          data: (plan) {
            setState(() {
              _plan = plan;
            });
          },
        );
      },
    );
    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

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
            child: Image.asset(
              'images/map.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SlidingBox(
          style: BoxStyle.sheet,
          minHeight: height * 0.25,
          maxHeight: height * 0.75,
          color: colorScheme.surface,
          draggableIconBackColor: colorScheme.surface,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(32),
          ),
          controller: _boxController,
          collapsed: true,
          draggable: true,
          animationCurve: Curves.easeInOut,
          bodyBuilder: (scrollController, boxPosition) {
            return Column(
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
                    ref.read(planProvider.notifier).reorder(
                          from,
                          to,
                        );
                  },
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    return Container(
                      key: Key(index.toString()),
                      margin: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      decoration: index == _plan.length
                          ? null
                          : BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: colorScheme.outline,
                                  width: 1,
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
                          _plan[index].date?.toString() ?? "",
                          style: GoogleFonts.roboto().copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                        subtitle: Text(
                          _plan[index].place.toString(),
                          style: GoogleFonts.roboto().copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: _plan.length,
                ),
              ],
            );
          },
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: colorScheme.surface,
            height: 80,
          ),
        ),
      ],
    );
  }
}
