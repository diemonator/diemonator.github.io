import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/main/main_bloc.dart';
import '../../features/main/main_view.dart';
import '../../features/sections/contacts/contacts_view.dart';
import '../../features/sections/home/home_view.dart';
import '../../features/sections/portfolio/portfolio_details_view.dart';
import '../../features/sections/portfolio/portfolio_view.dart';
import '../../features/sections/profile/profile_view.dart';
import '../di/locator.dart';
import 'app_routes.dart';

part 'sections/contacts_section_routes.dart';
part 'sections/home_sections_routes.dart';
part 'sections/portfolio_section_routes.dart';
part 'sections/profile_section_routes.dart';

const _rootNavigatorKey = GlobalObjectKey<NavigatorState>('root');

final goRouterDelegate = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.home.path,
  debugLogDiagnostics: true,
  routes: [
    ShellRoute(
      pageBuilder: (context, state, child) => CustomTransitionPage(
        child: BlocProvider<MainBloc>(
          create: (context) => locator.get(),
          child: MainView(
            child,
            key: state.pageKey,
          ),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
      routes: [
        _homeSectionRoutes,
        _portfolioSectionRoutes,
        _profileSectionRoutes,
        _contactsSectionRoutes,
      ],
    ),
  ],
);
