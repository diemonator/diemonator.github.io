import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_assets.dart';
import 'widgets/bottom_bar.dart';
import 'widgets/header.dart';
import 'widgets/navbar.dart';
import 'widgets/route_title.dart';
import 'widgets/theme_button.dart';

class MainView extends StatelessWidget {
  const MainView(this._navigationShell, {super.key});

  final StatefulNavigationShell _navigationShell;

  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.sizeOf(context).width < 600;

    return Scaffold(
      appBar: isSmall
          ? AppBar(
              leading: const Image(image: AssetImage(AppAssets.signature)),
              title: const RouteTitle(),
              actions: const [ThemeButton()],
            )
          : null,
      bottomNavigationBar: BottomBar(
        _navigationShell.currentIndex,
        _navigationShell.goBranch,
      ),
      body: Column(
        children: [
          if (!isSmall) const Header(),
          Expanded(
            child: Row(
              children: [
                if (!isSmall)
                  Navbar(
                    _navigationShell.currentIndex,
                    _navigationShell.goBranch,
                  ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _navigationShell),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
