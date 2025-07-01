import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/route_names.dart';
import '../generated/l10n.dart';

class MainScaffold extends ConsumerStatefulWidget {
  const MainScaffold({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends ConsumerState<MainScaffold> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final floatingIcon = Icon(
      color: Theme.of(context).colorScheme.onPrimary,
      Icons.assistant,
    );

    final iconData = [
      Icon(
        Icons.home,
        color: Theme.of(context).colorScheme.onPrimary,
        shadows: [
          Shadow(
            color: Theme.of(context).colorScheme.shadow,
          ),
        ],
      ),
      Icon(
        Icons.airplanemode_active,
        color: Theme.of(context).colorScheme.onPrimary,
        shadows: [
          Shadow(
            color: Theme.of(context).colorScheme.shadow,
          ),
        ],
      ),
      Icon(
        Icons.edit,
        color: Theme.of(context).colorScheme.onPrimary,
        shadows: [
          Shadow(
            color: Theme.of(context).colorScheme.shadow,
          ),
        ],
      ),
      Icon(
        Icons.menu,
        color: Theme.of(context).colorScheme.onPrimary,
        shadows: [
          Shadow(
            color: Theme.of(context).colorScheme.shadow,
          ),
        ],
      ),
    ];

    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Theme.of(context).colorScheme.primary,
        Theme.of(context).colorScheme.tertiary,
      ],
      stops: [
        0,
        100,
      ],
    );
    final gradientDecoration = BoxDecoration(
      gradient: gradient,
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBar(
          titleSpacing: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: gradientDecoration.copyWith(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow.withAlpha(128),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: Offset(0, 4),
                ),
              ],
              borderRadius: SmoothBorderRadius(
                cornerRadius: 10,
                cornerSmoothing: 1,
              ),
            ),
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 8,
                ),
                child: Hero(
                  tag: "logo",
                  child: Image.asset('images/lundi_logo.png'),
                ),
              ),
              Text(
                S.of(context).appName,
                style: GoogleFonts.agdasima().copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 32,
                ),
              ),
            ],
          ),
        ),
      ),
      body: widget.child,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Theme.of(context).colorScheme.surface,
            width: 1,
          ),
        ),
        child: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 5,
          child: floatingIcon,
          onPressed: () {
            GoRouter.of(context).pushNamed(RouteNames.assist);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        shadow: Shadow(
          color: Theme.of(context).colorScheme.shadow.withAlpha(128),
          offset: Offset(0, -4),
          blurRadius: 5,
        ),
        height: 80,
        borderColor: Theme.of(context).colorScheme.surface,
        borderWidth: 5,
        gapLocation: GapLocation.none,
        backgroundGradient: gradient,
        backgroundColor: Theme.of(context).colorScheme.surface,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        itemCount: 4,
        tabBuilder: (index, isActive) {
          return iconData[index];
        },
        activeIndex: _currentIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              GoRouter.of(context).pushNamed(RouteNames.home);
            case 1:
              GoRouter.of(context).pushNamed(RouteNames.plan);
            case 2:
              GoRouter.of(context).pushNamed(RouteNames.edit);
            case 3:
              GoRouter.of(context).pushNamed(RouteNames.settings);
              break;
          }
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
