import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/presentation/app_cubit.dart';
import '../../app/presentation/app_state.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final icon = state.themeMode == ThemeMode.dark
            ? Icons.dark_mode
            : Icons.light_mode;

        return IconButton(
          onPressed: () async {
            final bloc = BlocProvider.of<AppCubit>(context);
            await bloc.toggleTheme();
          },
          icon: Icon(icon),
        );
      },
    );
  }
}
