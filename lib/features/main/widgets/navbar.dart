import 'package:flutter/material.dart';

import '../../../core/navigation/app_routes.dart';

class Navbar extends StatelessWidget {
  const Navbar(
    this._currentIndex,
    this._onDestinationSelected, {
    super.key,
  });

  final int _currentIndex;
  final void Function(int) _onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final navRailItems = AppRoutes.navRailItems;

    if (screenWidth < 600) {
      return const SizedBox.shrink();
    }

    final colorScheme = Theme.of(context).colorScheme;

    return NavigationRail(
      selectedLabelTextStyle: TextStyle(color: colorScheme.primary),
      selectedIconTheme: IconThemeData(color: colorScheme.primary),
      destinations: navRailItems,
      labelType: NavigationRailLabelType.all,
      selectedIndex: _currentIndex,
      onDestinationSelected: _onDestinationSelected,
      useIndicator: true,
    );
  }
}
