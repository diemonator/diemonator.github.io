import 'package:flutter/material.dart';

enum AppRoutes {
  home.tab(
    'home',
    '/home',
    iconData: Icons.home_outlined,
    activeIcon: Icons.home,
  ),
  portfolio.tab(
    'portfolio',
    '/portfolio',
    iconData: Icons.work_outline,
    activeIcon: Icons.work,
    children: [
      AppRoutes.mobile,
      AppRoutes.desktop,
      AppRoutes.backend,
      AppRoutes.databases,
    ],
  ),
  profile.tab(
    'profile',
    '/profile',
    iconData: Icons.person_outline,
    activeIcon: Icons.person,
  ),
  contacts.tab(
    'contacts',
    '/contacts',
    iconData: Icons.email_outlined,
    activeIcon: Icons.email,
  ),
  mobile(
    'mobile',
    '/mobile',
    title: 'Mobile',
    iconData: Icons.phone_android_outlined,
  ),
  desktop(
    'desktop',
    '/desktop',
    title: 'Desktop',
    iconData: Icons.desktop_windows_outlined,
  ),
  backend(
    'backend',
    '/backend',
    title: 'Backend',
    iconData: Icons.code,
  ),
  databases(
    'databases',
    '/databases',
    title: 'Databases',
    iconData: Icons.storage,
  ),
  ;

  const AppRoutes(
    this.name,
    this.path, {
    required this.iconData,
    this.title = '',
  })  : children = const [],
        isTab = false,
        activeIcon = null,
        assetPath = '';

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
  final IconData iconData;
  final IconData? activeIcon;
  final bool isTab;
  final List<AppRoutes> children;

  static List<AppRoutes> get tabs {
    return values.where((element) => element.isTab).toList(growable: false);
  }
}
