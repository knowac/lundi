import 'dart:async';

import 'package:feature_home/presentation/widgets/lundi_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/config/route_names.dart';

class LundiBottomNavigationBar extends ConsumerStatefulWidget {
  const LundiBottomNavigationBar({super.key});

  @override
  ConsumerState<LundiBottomNavigationBar> createState() =>
      _LundiBottomNavigationBarState();
}

class _LundiBottomNavigationBarState
    extends ConsumerState<LundiBottomNavigationBar> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: const BoxDecoration(
      color: Colors.white,
      border: Border(top: BorderSide(color: Colors.white, width: 3)),
    ),
    child: BottomNavigationBar(
      backgroundColor: Colors.transparent,
      selectedItemColor: Theme.of(context).colorScheme.onTertiaryFixedVariant,
      unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
      selectedFontSize: 0,
      unselectedFontSize: 0,
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            unawaited(GoRouter.of(context).pushNamed(RouteNames.home));
          case 1:
            unawaited(GoRouter.of(context).pushNamed(RouteNames.plan));
          case 2:
            unawaited(GoRouter.of(context).pushNamed(RouteNames.assist));
          case 3:
            unawaited(GoRouter.of(context).pushNamed(RouteNames.edit));
          case 4:
            unawaited(GoRouter.of(context).pushNamed(RouteNames.settings));
        }
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        LundiNavigationBarItem(iconData: Icons.home),
        LundiNavigationBarItem(iconData: Icons.airplanemode_active),
        LundiNavigationBarItem(iconData: Icons.assistant),
        LundiNavigationBarItem(iconData: Icons.edit),
        LundiNavigationBarItem(iconData: Icons.menu),
      ],
    ),
  );
}
