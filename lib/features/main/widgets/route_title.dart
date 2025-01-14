import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/navigation/app_routes.dart';

class RouteTitle extends StatefulWidget {
  const RouteTitle({super.key, this.textStyle});

  final TextStyle? textStyle;

  @override
  State<StatefulWidget> createState() => _RouteTitleState();
}

class _RouteTitleState extends State<RouteTitle> {
  late String _label;
  late GoRouterDelegate routerDelegate;

  @override
  void initState() {
    routerDelegate = GoRouter.of(context).routerDelegate;
    _label = routerDelegate.state?.name ?? '';
    routerDelegate.addListener(_updateUi);
    super.initState();
  }

  void _updateUi() {
    final routeStateName = GoRouter.of(context).state?.name;

    if (routeStateName != null) {
      final appRoute = AppRoutes.tabs.firstWhereOrNull(
        (route) => route.name == routeStateName,
      );

      setState(() => _label = appRoute?.name ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SelectableText(_label, style: widget.textStyle);
  }

  @override
  void dispose() {
    routerDelegate.removeListener(_updateUi);
    super.dispose();
  }
}
