import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_assets.dart';
import '../../core/extensions/media_query_extensions.dart';
import '../../core/navigation/app_routes.dart';
import '../app/presentation/app_bloc.dart';
import '../app/presentation/app_state.dart';
import '../app/presentation/widgets/settings_popup_menu.dart';
import 'main_bloc.dart';
import 'main_event.dart';
import 'main_state.dart';
import 'widgets/bottom_bar.dart';
import 'widgets/header.dart';
import 'widgets/navbar.dart';
import 'widgets/route_title.dart';

class MainView extends StatefulWidget {
  const MainView(this._child, {super.key});

  final Widget _child;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_initialized) {
      _initialized = true;
      final path = GoRouter.of(context).state.uri.path;
      context.read<MainBloc>().add(MainSyncRouteEvent(path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();

    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) {
        return previous.isMobileLayoutEnabled != current.isMobileLayoutEnabled;
      },
      builder: (context, state) {
        final isMobileScreen = context.isMobileScreen;

        return Scaffold(
          appBar: isMobileScreen
              ? AppBar(
                  leading: InkWell(
                    onTap: () {
                      context.goNamed(AppRoutes.home.name);
                      context.read<MainBloc>().add(
                            MainSyncRouteEvent(AppRoutes.home.path),
                          );
                    },
                    child: const Image(image: AssetImage(AppAssets.signature)),
                  ),
                  title: const RouteTitle(),
                  actions: const [SettingsPopupMenu()],
                )
              : null,
          bottomNavigationBar: BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              return BottomBar(
                state.currentIndex,
                (index) {
                  mainBloc.add(MainNavigationEvent(index));
                  context.go(AppRoutes.tabs[index].path);
                },
              );
            },
          ),
          body: Column(
            children: [
              if (!isMobileScreen) const Header(),
              Expanded(
                child: Row(
                  children: [
                    if (!isMobileScreen)
                      BlocBuilder<MainBloc, MainState>(
                        builder: (context, state) {
                          return Navbar(
                            state.currentIndex,
                            (index) {
                              mainBloc.add(MainNavigationEvent(index));
                              context.go(AppRoutes.tabs[index].path);
                            },
                          );
                        },
                      ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Expanded(child: widget._child)],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
