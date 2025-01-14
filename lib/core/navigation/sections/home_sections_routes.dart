part of '../app_navigation.dart';

final _homeSectionRoutes = GoRoute(
  name: AppRoutes.home.name,
  path: AppRoutes.home.path,
  pageBuilder: (context, state) => CustomTransitionPage(
    child: const HomeView(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  ),
);
