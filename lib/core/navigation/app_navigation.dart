import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../features/contacts/presentation/bloc/contacts_bloc.dart';
import '../../features/contacts/presentation/contacts_view.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';
import '../../features/home/presentation/home_view.dart';
import '../../features/main/presentation/bloc/main_bloc.dart';
import '../../features/main/presentation/main_view.dart';
import '../../features/portfolio/presentation/bloc/portfolio_bloc.dart';
import '../../features/portfolio/presentation/bloc/portfolio_detail_bloc.dart';
import '../../features/portfolio/presentation/portfolio_detail_view.dart';
import '../../features/portfolio/presentation/portfolio_view.dart';
import '../../features/profile/presentation/bloc/profile_bloc.dart';
import '../../features/profile/presentation/profile_view.dart';
import 'app_routes.dart';

const _rootNavigatorKey = GlobalObjectKey<NavigatorState>('root');

/// Every section page fades in the same way, so the builder lives here once.
CustomTransitionPage<void> _fadePage(Widget child, {LocalKey? key}) {
  return CustomTransitionPage(
    key: key,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
    child: child,
  );
}

/// Each section provides its own bloc at the route, so a bloc is built when
/// its page is and disposed with it — nothing section-specific lives in the
/// shell.
GoRoute _sectionRoute(
  AppRoutes route,
  Widget Function() builder, {
  List<GoRoute> children = const [],
}) {
  return GoRoute(
    name: route.name,
    path: route.path,
    pageBuilder: (context, state) => _fadePage(builder()),
    routes: children,
  );
}

/// Builds a *fresh* router each call rather than exposing a global one. A
/// top-level `final GoRouter` keeps its location for the process lifetime,
/// which leaks navigation state between tests and makes the router impossible
/// to rebuild. [App] holds one for its own lifetime.
GoRouter createRouter() => GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.home.path,
  debugLogDiagnostics: true,
  // Without this an unknown URL leaves the router holding no match, which is
  // both go_router's raw developer error screen and a "Bad state: No element"
  // out of every widget that reads the current route — MainView and RouteTitle
  // both do. There is no 404 content worth showing on a portfolio, so send
  // them home.
  onException: (context, state, router) => router.go(AppRoutes.home.path),
  routes: [
    ShellRoute(
      pageBuilder: (context, state, child) => _fadePage(
        BlocProvider<MainBloc>(
          create: (context) => GetIt.I<MainBloc>(),
          child: MainView(child, key: state.pageKey),
        ),
      ),
      routes: [
        _sectionRoute(
          AppRoutes.home,
          () => BlocProvider<HomeBloc>(
            create: (context) => GetIt.I<HomeBloc>(),
            child: const HomeView(),
          ),
        ),
        _sectionRoute(
          AppRoutes.portfolio,
          () => BlocProvider<PortfolioBloc>(
            create: (context) => GetIt.I<PortfolioBloc>(),
            child: const PortfolioView(),
          ),
          children: AppRoutes.portfolio.children
              .map(
                (child) => GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  name: child.name,
                  path: child.path,
                  builder: (context, state) =>
                      BlocProvider<PortfolioDetailBloc>(
                        create: (context) => GetIt.I<PortfolioDetailBloc>(),
                        child: const PortfolioDetailView(),
                      ),
                ),
              )
              .toList(growable: false),
        ),
        _sectionRoute(
          AppRoutes.profile,
          () => BlocProvider<ProfileBloc>(
            create: (context) => GetIt.I<ProfileBloc>(),
            child: const ProfileView(),
          ),
        ),
        _sectionRoute(
          AppRoutes.contacts,
          () => BlocProvider<ContactsBloc>(
            create: (context) => GetIt.I<ContactsBloc>(),
            child: const ContactsView(),
          ),
        ),
      ],
    ),
  ],
);
