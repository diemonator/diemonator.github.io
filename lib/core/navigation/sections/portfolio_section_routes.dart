part of '../app_navigation.dart';

final _portfolioSectionRoutes = GoRoute(
  name: AppRoutes.portfolio.name,
  path: AppRoutes.portfolio.path,
  pageBuilder: (context, state) => CustomTransitionPage(
    child: const PortfolioView(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  ),
  routes: AppRoutes.portfolio.children
      .map(
        (e) => GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          name: e.name,
          path: e.path,
          builder: (context, state) => const PortfolioDetailsView(),
        ),
      )
      .toList(),
);
