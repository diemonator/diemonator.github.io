import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/language_extensions.dart';
import '../../../core/localization/generated/app_localizations.dart';
import '../../../core/navigation/app_navigation.dart';
import '../../../core/themes/themes.dart';
import 'app_bloc.dart';
import 'app_state.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AppBloc, AppState>(
        buildWhen: (state, previousState) {
          return state != previousState;
        },
        builder: (context, state) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: goRouterDelegate,
          themeMode: state.themeMode,
          theme: theme,
          darkTheme: darkTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: state.locale,
          onGenerateTitle: (context) => context.appLocalizations.appTitle,
        ),
      ),
    );
  }
}
