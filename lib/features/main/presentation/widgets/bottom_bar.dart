import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/media_query_extensions.dart';
import '../../../../core/extensions/nav_items_extensions.dart';
import '../../../app/presentation/bloc/app_bloc.dart';
import 'footer.dart';

class BottomBar extends StatelessWidget {
  const BottomBar(this._currentIndex, this._onDestinationSelected, {super.key});

  final int _currentIndex;
  final void Function(int) _onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    context.watch<AppBloc>();
    final isMobileScreen = context.isMobileScreen;
    if (!isMobileScreen) {
      return const Footer();
    }

    return NavigationBar(
      onDestinationSelected: _onDestinationSelected,
      selectedIndex: _currentIndex,
      destinations: NavigationBarDestinations.of(context),
    );
  }
}
