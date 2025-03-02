import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/navigation/app_routes.dart';
import '../../app/presentation/widgets/settings_popup_menu.dart';
import '../main_bloc.dart';
import '../main_event.dart';
import 'route_title.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            color: Colors.black,
            child: InkWell(
              onTap: () {
                context.goNamed(AppRoutes.home.name);
                context.read<MainBloc>().add(
                      MainSyncRouteEvent(AppRoutes.home.path),
                    );
              },
              child: const Image(image: AssetImage(AppAssets.signature)),
            ),
          ),
          const Expanded(
            child: Stack(
              children: [
                Align(
                  child: RouteTitle(
                    textStyle: TextStyle(fontSize: 28),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SettingsPopupMenu(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
