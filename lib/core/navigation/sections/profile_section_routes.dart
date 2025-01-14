part of '../app_navigation.dart';

final _profileSectionRoutes = GoRoute(
  name: AppRoutes.profile.name,
  path: AppRoutes.profile.path,
  pageBuilder: (context, state) => CustomTransitionPage(
    child: const ProfileView(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  ),
);
