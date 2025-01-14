import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_assets.dart';
import '../../core/extensions/media_query_extensions.dart';
import '../../core/navigation/app_routes.dart';
import '../app/presentation/app_cubit.dart';
import '../app/presentation/app_state.dart';
import '../app/presentation/widgets/settings_popup_menu.dart';
import 'main_bloc.dart';
import 'widgets/bottom_bar.dart';
import 'widgets/header.dart';
import 'widgets/navbar.dart';
import 'widgets/route_title.dart';

class MainView extends StatelessWidget {
  const MainView(this._child, {super.key});

  final Widget _child;

  void _init(BuildContext context) {
    final path = GoRouter.of(context).state.uri.path;
    final index = AppRoutes.tabs.indexWhere((tab) => path.startsWith(tab.path));
    final bloc = context.read<MainBloc>();

    if (index != -1 && bloc.state.currentIndex != index) {
      bloc.add(MainNavigationEvent(index));
    }
  }

  @override
  Widget build(BuildContext context) {
    _init(context);

    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (previous, current) {
        return previous.isMobileLayoutEnabled != current.isMobileLayoutEnabled;
      },
      builder: (context, state) {
        final isMobileScreen = context.isMobileScreen;

        return Scaffold(
          appBar: isMobileScreen
              ? AppBar(
                  leading: InkWell(
                    onTap: () => context.goNamed(AppRoutes.home.name),
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
                (index) => context
                  ..read<MainBloc>().add(MainNavigationEvent(index))
                  ..go(AppRoutes.tabs[index].path),
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
                            (index) => context
                              ..read<MainBloc>().add(MainNavigationEvent(index))
                              ..go(AppRoutes.tabs[index].path),
                          );
                        },
                      ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Expanded(child: _child)],
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
