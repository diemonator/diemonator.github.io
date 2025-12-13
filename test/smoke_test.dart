import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/core/di/locator.dart';
import 'package:portfolio/features/app/presentation/app.dart';
import 'package:portfolio/features/app/presentation/app_bloc.dart';
import 'package:portfolio/features/main/main_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Smoke test - App starts and renders MainView', (tester) async {
    // 1. Setup mocks
    SharedPreferences.setMockInitialValues({});
    await GetIt.I.reset();
    await locator.initLocator();

    // 2. Pump widget
    await tester.pumpWidget(
      BlocProvider<AppBloc>(
        create: (context) => locator.get<AppBloc>(),
        child: const App(),
      ),
    );

    await tester.pumpAndSettle();

    // 3. Verify
    expect(find.byType(MainView), findsOneWidget);
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
