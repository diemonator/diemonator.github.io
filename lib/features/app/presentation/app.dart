import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/navigation/app_navigation.dart';
import '../../../core/themes/themes.dart';
import 'app_cubit.dart';
import 'app_state.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AppCubit, AppState>(
        buildWhen: (state, previousState) {
          return state.themeMode != previousState.themeMode;
        },
        builder: (context, state) => MaterialApp.router(
          themeMode: state.themeMode,
          theme: theme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: goRouterDelegate,
        ),
      ),
    );
  }
}
