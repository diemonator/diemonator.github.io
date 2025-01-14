import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/media_query_extensions.dart';
import '../../../core/extensions/nav_items_extensions.dart';
import '../../app/presentation/app_cubit.dart';
import 'footer.dart';

class BottomBar extends StatelessWidget {
  const BottomBar(
    this._currentIndex,
    this._onDestinationSelected, {
    super.key,
  });

  final int _currentIndex;
  final void Function(int) _onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    context.watch<AppCubit>();
    final isMobileScreen = context.isMobileScreen;
    if (!isMobileScreen) {
      return const Footer();
    }

    final colorScheme = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      onTap: _onDestinationSelected,
      currentIndex: _currentIndex,
      items: BottomNavigationBarItems.of(context),
      unselectedItemColor: colorScheme.onSurface,
      selectedItemColor: colorScheme.primary,
    );
  }
}
