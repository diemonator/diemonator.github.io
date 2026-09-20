import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/language_extensions.dart';
import '../../../core/extensions/media_query_extensions.dart';
import '../../../core/localization/generated/app_localizations.dart';
import '../../../core/navigation/app_navigation.dart';
import '../../../core/themes/themes.dart';
import '../../../core/widgets/asset_precacher.dart';
import 'bloc/app_bloc.dart';
import 'bloc/app_state.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  /// Built once for this App's lifetime: `routerConfig` must be the same
  /// instance across rebuilds, or every theme change resets navigation.
  final GoRouter _router = createRouter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) => LayoutBuilder(
        builder: (context, constraints) {
          // Built here rather than per-widget: the display type scale is the
          // one thing the theme needs the screen width for, and MediaQuery is
          // not available above MaterialApp.
          final compact =
              constraints.maxWidth <= MediaQueryExtensions.mobileScreen;

          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: _router,
            builder: (context, child) => AssetPrecacher(child: child!),
            themeMode: state.themeMode,
            theme: buildTheme(brightness: Brightness.light, compact: compact),
            darkTheme: buildTheme(
              brightness: Brightness.dark,
              compact: compact,
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: state.locale,
            onGenerateTitle: (context) => context.appLocalizations.appTitle,
          );
        },
      ),
    );
  }
}
