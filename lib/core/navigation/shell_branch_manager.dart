import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

class ShellBranchManager {
  const ShellBranchManager(this.child);

  final Widget child;

  List<StatefulShellBranch> getStatefulShellBranches() {
    return AppRoutes.tabs
        .map(
          (e) => StatefulShellBranch(
            routes: [
              GoRoute(
                name: e.name,
                path: e.path,
                pageBuilder: (context, state) => CustomTransitionPage(
                  child: child,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                ),
                routes: e.children
                    .map((e) => GoRoute(name: e.name, path: e.path))
                    .toList(growable: false),
              ),
            ],
          ),
        )
        .toList(growable: false);
  }
}
