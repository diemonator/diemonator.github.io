import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/nav_items_extensions.dart';
import '../../../core/navigation/app_routes.dart';

class RouteTitle extends StatefulWidget {
  const RouteTitle({super.key, this.textStyle});

  final TextStyle? textStyle;

  @override
  State<StatefulWidget> createState() => _RouteTitleState();
}

class _RouteTitleState extends State<RouteTitle>
    with SingleTickerProviderStateMixin {
  late final GoRouterDelegate routerDelegate;
  late String _label = '';
  static final _tweenFadeIn = Tween<double>(begin: 0.0, end: 1.0);

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    routerDelegate = GoRouter.of(context).routerDelegate;
    routerDelegate.addListener(_updateUi);

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _fadeAnimation = _tweenFadeIn.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _label = _getLocalizedLabel();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: SelectableText(_label, style: widget.textStyle),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    routerDelegate.removeListener(_updateUi);
  }

  String _getLocalizedLabel() {
    final routeStateName = GoRouter.of(context).state.name ?? '';

    if (routeStateName.isEmpty) {
      return '';
    }

    final appRoute = AppRoutes.tabs.firstWhereOrNull(
      (route) => route.name == routeStateName,
    );

    if (appRoute == null) {
      return '';
    }

    return context.getLocalizedNavItemLabel(appRoute);
  }

  void _updateUi() {
    final label = _getLocalizedLabel();
    if (label.isNotEmpty) {
      setState(() {
        _label = label;
        _animationController.forward(from: 0.0);
      });
    }
  }
}
