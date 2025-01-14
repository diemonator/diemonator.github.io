import 'package:flutter/material.dart';

import '../constants/app_assets.dart';

enum AppRoutes {
  home.tab(
    'Home',
    '/home',
    iconData: Icons.home_outlined,
    activeIcon: Icons.home,
  ),
  portfolio.tab(
    'Portfolio',
    '/portfolio',
    iconData: Icons.work_outline,
    activeIcon: Icons.work,
    children: [
      AppRoutes.flutter,
      AppRoutes.android,
      AppRoutes.ios,
      AppRoutes.csharp,
      AppRoutes.node,
    ],
  ),
  profile.tab(
    'Profile',
    '/profile',
    iconData: Icons.person_outline,
    activeIcon: Icons.person,
  ),
  contacts.tab(
    'Contacts',
    '/contacts',
    iconData: Icons.email_outlined,
    activeIcon: Icons.email,
  ),
  flutter(
    'flutter',
    '/flutter',
    title: 'Flutter',
    assetPath: AppAssets.flutter,
  ),
  android(
    'android',
    '/android',
    title: 'Android',
    assetPath: AppAssets.android,
  ),
  ios(
    'ios',
    '/ios',
    title: 'iOS',
    assetPath: AppAssets.ios,
  ),
  csharp(
    'asp',
    '/asp',
    title: 'ASP.NET Core',
    assetPath: AppAssets.asp,
  ),
  node(
    'node',
    '/node',
    title: 'Node',
    assetPath: AppAssets.node,
  ),
  ;

  const AppRoutes(
    this.name,
    this.path, {
    this.title = '',
    this.assetPath = '',
  })  : children = const [],
        isTab = false,
        activeIcon = null,
        iconData = null;

  const AppRoutes.tab(
    this.name,
    this.path, {
    required this.iconData,
    required this.activeIcon,
    this.children = const [],
  })  : isTab = true,
        title = '',
        assetPath = '';

  final String name;
  final String path;
  final String title;
  final String assetPath;
  final IconData? iconData;
  final IconData? activeIcon;
  final bool isTab;
  final List<AppRoutes> children;

  static List<AppRoutes> get tabs {
    return values.where((element) => element.isTab).toList(growable: false);
  }

  static List<BottomNavigationBarItem> get navbarItems {
    return tabs
        .map(
          (e) => BottomNavigationBarItem(
            label: e.name,
            icon: Icon(e.iconData),
            activeIcon: Icon(e.activeIcon),
            tooltip: e.name,
          ),
        )
        .toList(growable: false);
  }

  static List<NavigationRailDestination> get navRailItems {
    return tabs
        .map(
          (e) => NavigationRailDestination(
            label: Text(e.name),
            icon: Icon(e.iconData),
            selectedIcon: Icon(e.activeIcon),
          ),
        )
        .toList(growable: false);
  }
}
