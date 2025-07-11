import 'package:flutter/material.dart';

class LundiNavigationBarIcon extends StatelessWidget {
  const LundiNavigationBarIcon({
    required this.icon,
    super.key,
  });
  final IconData? icon;

  @override
  Widget build(BuildContext context) => Icon(
    shadows: [
      Shadow(
        color: Theme.of(context).colorScheme.shadow.withAlpha(128),
        offset: const Offset(0, 4),
        blurRadius: 4,
      ),
    ],
    icon,
  );
}

class LundiNavigationBarItem extends BottomNavigationBarItem {
  LundiNavigationBarItem({required this.iconData})
    : super(
        icon: LundiNavigationBarIcon(icon: iconData),
        label: '',
      );
  final IconData? iconData;
}
