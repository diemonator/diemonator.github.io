import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';
import 'language_extensions.dart';

extension BottomNavigationBarItems on BottomNavigationBarItem {
  static List<BottomNavigationBarItem> of(BuildContext context) {
    return AppRoutes.tabs
        .map(
          (tabRoute) => BottomNavigationBarItem(
            label: context.getLocalizedNavItemLabel(tabRoute),
            icon: Icon(tabRoute.iconData),
            activeIcon: Icon(tabRoute.activeIcon),
            tooltip: tabRoute.name,
          ),
        )
        .toList(growable: false);
  }
}

extension NavigationRailDestinations on NavigationRailDestination {
  static List<NavigationRailDestination> of(BuildContext context) {
    return AppRoutes.tabs
        .map(
          (tabRoute) => NavigationRailDestination(
            label: Text(context.getLocalizedNavItemLabel(tabRoute)),
            icon: Icon(tabRoute.iconData),
            selectedIcon: Icon(tabRoute.activeIcon),
          ),
        )
        .toList(growable: false);
  }
}

extension NavItemsExtensions on BuildContext {
  String getLocalizedNavItemLabel(AppRoutes route) {
    return switch (route) {
      AppRoutes.home => appLocalizations.home,
      AppRoutes.portfolio => appLocalizations.portfolio,
      AppRoutes.profile => appLocalizations.profile,
      AppRoutes.contacts => appLocalizations.contacts,
      _ => throw UnimplementedError(),
    };
  }

  List<BottomNavigationBarItem> get navBarItems {
    return BottomNavigationBarItems.of(this);
  }

  List<NavigationRailDestination> get navRailItems {
    return NavigationRailDestinations.of(this);
  }
}
