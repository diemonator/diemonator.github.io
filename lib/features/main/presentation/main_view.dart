import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/extensions/media_query_extensions.dart';
import '../../../core/navigation/app_routes.dart';
import '../../../core/themes/app_spacing.dart';
import '../../../core/themes/theme_extension.dart';
import '../../app/presentation/bloc/app_bloc.dart';
import '../../app/presentation/bloc/app_state.dart';
import '../../app/presentation/widgets/settings_popup_menu.dart';
import 'bloc/main_bloc.dart';
import 'bloc/main_event.dart';
import 'bloc/main_state.dart';
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
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final path = GoRouterState.of(context).uri.path;
    context.read<MainBloc>().add(MainSyncRouteEvent(path));
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
                  leadingWidth: 64,
                  leading: InkWell(
                    onTap: () {
                      context.goNamed(AppRoutes.home.name);
                      mainBloc.add(MainSyncRouteEvent(AppRoutes.home.path));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.sm),
                      child: SvgPicture.asset(
                        AppAssets.signature,
                        colorFilter: ColorFilter.mode(
                          context.colors.onSurface,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  title: const RouteTitle(),
                  actions: const [
                    SettingsPopupMenu(),
                    SizedBox(width: AppSpacing.xs),
                  ],
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(1),
                    child: Divider(
                      height: 1,
                      color: context.colors.outlineVariant,
                    ),
                  ),
                )
              : null,
          bottomNavigationBar: BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              return BottomBar(state.currentIndex, (index) {
                mainBloc.add(MainNavigationEvent(index));
                context.go(AppRoutes.tabs[index].path);
              });
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
                          return Navbar(state.currentIndex, (index) {
                            mainBloc.add(MainNavigationEvent(index));
                            context.go(AppRoutes.tabs[index].path);
                          });
                        },
                      ),
                    Expanded(child: widget._child),
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
