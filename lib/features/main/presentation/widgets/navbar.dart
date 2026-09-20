import 'package:flutter/material.dart';

import '../../../../core/extensions/media_query_extensions.dart';
import '../../../../core/extensions/nav_items_extensions.dart';
import '../../../../core/themes/theme_extension.dart';

class Navbar extends StatelessWidget {
  const Navbar(this._currentIndex, this._onDestinationSelected, {super.key});

  final int _currentIndex;
  final void Function(int) _onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    if (context.isMobileScreen) {
      return const SizedBox.shrink();
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(right: BorderSide(color: context.colors.outlineVariant)),
      ),
      child: NavigationRail(
        destinations: NavigationRailDestinations.of(context),
        labelType: .all,
        selectedIndex: _currentIndex,
        onDestinationSelected: _onDestinationSelected,
        useIndicator: true,
      ),
    );
  }
}
