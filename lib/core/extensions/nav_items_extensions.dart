import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';
import 'language_extensions.dart';

extension NavigationBarDestinations on NavigationDestination {
  static List<NavigationDestination> of(BuildContext context) {
    return AppRoutes.tabs
        .map(
          (tabRoute) => NavigationDestination(
            label: context.getLocalizedNavItemLabel(tabRoute),
            icon: Icon(tabRoute.iconData),
            selectedIcon: Icon(tabRoute.activeIcon),
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

  List<NavigationDestination> get navBarItems {
    return NavigationBarDestinations.of(this);
  }

  List<NavigationRailDestination> get navRailItems {
    return NavigationRailDestinations.of(this);
  }
}
