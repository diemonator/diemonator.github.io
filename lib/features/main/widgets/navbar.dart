import 'package:flutter/material.dart';

import '../../../core/extensions/media_query_extensions.dart';
import '../../../core/extensions/nav_items_extensions.dart';

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
    if (context.isMobileScreen) {
      return const SizedBox.shrink();
    }

    final colorScheme = Theme.of(context).colorScheme;

    return NavigationRail(
      selectedLabelTextStyle: TextStyle(color: colorScheme.primary),
      selectedIconTheme: IconThemeData(color: colorScheme.primary),
      destinations: NavigationRailDestinations.of(context),
      labelType: NavigationRailLabelType.all,
      selectedIndex: _currentIndex,
      onDestinationSelected: _onDestinationSelected,
      useIndicator: true,
    );
  }
}
