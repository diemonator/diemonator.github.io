import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/core/di/locator.dart';
import 'package:portfolio/features/app/presentation/app.dart';
import 'package:portfolio/features/app/presentation/app_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Smoke test - App starts', (WidgetTester tester) async {
    // Setup mocked SharedPreferences
    SharedPreferences.setMockInitialValues({});

    // Setup DI
    await locator.initLocator();

    await tester.pumpWidget(
      BlocProvider<AppBloc>(
        create: (context) => locator.get(),
        child: const App(),
      ),
    );

    // Verify that the app starts (finds MaterialApp by checking for something common inside it,
    // or just that it didn't crash).
    // The App widget builds a MaterialApp.router, which is a MaterialApp.
    expect(find.byType(App), findsOneWidget);
  });
}
