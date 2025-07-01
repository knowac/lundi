import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lundi/config/route_names.dart';
import 'package:lundi/widgets/lundi_navigation_bar_item.dart';

class LundiBottomNavigationBar extends ConsumerStatefulWidget {
  const LundiBottomNavigationBar({
    super.key,
  });

  @override
  ConsumerState<LundiBottomNavigationBar> createState() =>
      _LundiBottomNavigationBarState();
}

class _LundiBottomNavigationBarState
    extends ConsumerState<LundiBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.white, width: 3.0),
        ),
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
              GoRouter.of(context).pushNamed(RouteNames.home);
            case 1:
              GoRouter.of(context).pushNamed(RouteNames.plan);
            case 2:
              GoRouter.of(context).pushNamed(RouteNames.assist);
            case 3:
              GoRouter.of(context).pushNamed(RouteNames.edit);
            case 4:
              GoRouter.of(context).pushNamed(RouteNames.settings);
              break;
          }
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          LundiNavigationBarItem(
            iconData: Icons.home,
          ),
          LundiNavigationBarItem(
            iconData: Icons.airplanemode_active,
          ),
          LundiNavigationBarItem(
            iconData: Icons.assistant,
          ),
          LundiNavigationBarItem(
            iconData: Icons.edit,
          ),
          LundiNavigationBarItem(
            iconData: Icons.menu,
          ),
        ],
      ),
    );
  }
}
