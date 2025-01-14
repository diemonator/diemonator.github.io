part of '../app_navigation.dart';

final _contactsSectionRoutes = GoRoute(
  name: AppRoutes.contacts.name,
  path: AppRoutes.contacts.path,
  pageBuilder: (context, state) => CustomTransitionPage(
    child: const ContactsView(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  ),
);
