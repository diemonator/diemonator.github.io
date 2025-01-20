import 'package:flutter/material.dart';

import '../../../core/extensions/media_query_extensions.dart';
import '../../../core/navigation/app_routes.dart';
import 'footer.dart';

class BottomBar extends StatelessWidget {
  const BottomBar(
    this._currentIndex,
    this._onDestinationSelected, {
    super.key,
  });

  final int _currentIndex;
  final void Function(int) _onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final isScreenSmall = context.isScreenSmall;
    if (!isScreenSmall) {
      return const Footer();
    }

    final colorScheme = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      onTap: _onDestinationSelected,
      currentIndex: _currentIndex,
      items: AppRoutes.navbarItems,
      unselectedItemColor: colorScheme.onSurface,
      selectedItemColor: colorScheme.primary,
    );
  }
}
