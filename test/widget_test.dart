import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/core/di/di.dart';
import 'package:portfolio/features/app/presentation/app.dart';
import 'package:portfolio/features/app/presentation/bloc/app_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Smoke test - App starts', (WidgetTester tester) async {
    // Setup mocked SharedPreferences
    SharedPreferences.setMockInitialValues({});

    // Setup DI
    await GetIt.I.reset();
    DiExtensions.resetInitGuard();
    await GetIt.I.initDi(await SharedPreferences.getInstance());

    await tester.pumpWidget(
      BlocProvider<AppBloc>(
        create: (context) => GetIt.I<AppBloc>(),
        child: const App(),
      ),
    );

    // Verify that the app starts (finds MaterialApp
    // or just that it didn't crash).
    // The App widget builds a MaterialApp.router, which is a MaterialApp.
    expect(find.byType(App), findsOneWidget);
  });
}
