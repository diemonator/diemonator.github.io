import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/core/di/di.dart';
import 'package:portfolio/features/app/presentation/app.dart';
import 'package:portfolio/features/app/presentation/bloc/app_bloc.dart';
import 'package:portfolio/features/main/presentation/main_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Smoke test - App starts and renders MainView', (tester) async {
    // 1. Setup mocks
    SharedPreferences.setMockInitialValues({});
    await GetIt.I.reset();
    DiExtensions.resetInitGuard();
    await GetIt.I.initDi(await SharedPreferences.getInstance());

    // 2. Pump widget
    await tester.pumpWidget(
      BlocProvider<AppBloc>(
        create: (context) => GetIt.I<AppBloc>(),
        child: const App(),
      ),
    );

    await tester.pumpAndSettle();

    // 3. Verify
    expect(find.byType(MainView), findsOneWidget);
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
