import 'package:flutter/material.dart';

class LundiNavigationBarIcon extends StatelessWidget {
  final IconData? icon;
  const LundiNavigationBarIcon({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      shadows: [
        Shadow(
          color: Theme.of(context).colorScheme.shadow.withAlpha(128),
          offset: Offset(0, 4),
          blurRadius: 4,
        ),
      ],
      icon,
    );
  }
}

class LundiNavigationBarItem extends BottomNavigationBarItem {
  final IconData? iconData;
  LundiNavigationBarItem({required this.iconData})
      : super(icon: LundiNavigationBarIcon(icon: iconData));
}
