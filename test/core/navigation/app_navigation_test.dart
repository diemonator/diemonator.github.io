import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/core/di/di.dart';
import 'package:portfolio/core/localization/generated/app_localizations.dart';
import 'package:portfolio/core/navigation/app_navigation.dart';
import 'package:portfolio/core/navigation/app_routes.dart';
import 'package:portfolio/features/app/presentation/bloc/app_bloc.dart';
import 'package:portfolio/features/main/presentation/main_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await GetIt.I.reset();
    DiExtensions.resetInitGuard();
    await GetIt.I.initDi(await SharedPreferences.getInstance());
  });

  testWidgets('an unknown location lands on home instead of throwing', (
    tester,
  ) async {
    final router = createRouter();

    await tester.pumpWidget(
      BlocProvider<AppBloc>(
        create: (context) => GetIt.I<AppBloc>(),
        child: MaterialApp.router(
          routerConfig: router,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );
    await tester.pumpAndSettle();

    router.go('/does-not-exist');
    await tester.pumpAndSettle();

    // MainView and RouteTitle both read the current route, which threw
    // "Bad state: No element" while the router held no match.
    expect(tester.takeException(), isNull);
    expect(find.byType(MainView), findsOneWidget);
    expect(
      router.routerDelegate.currentConfiguration.uri.path,
      AppRoutes.home.path,
    );
  });
}
