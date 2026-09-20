import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/core/di/di.dart';
import 'package:portfolio/features/app/presentation/app.dart';
import 'package:portfolio/features/app/presentation/bloc/app_bloc.dart';
import 'package:portfolio/features/contacts/presentation/contacts_view.dart';
import 'package:portfolio/features/home/presentation/home_view.dart';
import 'package:portfolio/features/main/presentation/main_view.dart';
import 'package:portfolio/features/portfolio/presentation/portfolio_view.dart';
import 'package:portfolio/features/profile/presentation/profile_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Phone, tablet and desktop. The redesign branches on all three, and an
/// overflow only shows up at the width that triggers it.
const _sizes = <String, Size>{
  'phone': Size(390, 844),
  'tablet': Size(768, 1024),
  'desktop': Size(1440, 900),
};

Future<void> _pumpApp(WidgetTester tester, Size size) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);

  await GetIt.I.reset();
  DiExtensions.resetInitGuard();
  await GetIt.I.initDi(await SharedPreferences.getInstance());

  await tester.pumpWidget(
    BlocProvider<AppBloc>(
      create: (context) => GetIt.I<AppBloc>(),
      child: const App(),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));
  tearDown(() async {
    await GetIt.I.reset();
    DiExtensions.resetInitGuard();
  });

  for (final entry in _sizes.entries) {
    // pumpAndSettle rethrows a layout overflow as a test failure, so simply
    // reaching the assertions means every section laid out at this width.
    testWidgets('every section lays out on ${entry.key}', (tester) async {
      await _pumpApp(tester, entry.value);

      expect(find.byType(MainView), findsOneWidget);
      expect(find.byType(HomeView), findsOneWidget);

      // Each tab is visited and asserted, so a section that only breaks at
      // this width is caught where it breaks rather than at the last one.
      for (final (icon, view) in const [
        (Icons.work_outline, PortfolioView),
        (Icons.person_outline, ProfileView),
        (Icons.email_outlined, ContactsView),
      ]) {
        await tester.tap(find.byIcon(icon).first);
        await tester.pumpAndSettle();

        expect(find.byType(view), findsOneWidget, reason: 'on ${entry.key}');
      }
    });
  }

  testWidgets('phone shows the bottom bar, desktop the rail', (tester) async {
    await _pumpApp(tester, _sizes['phone']!);
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.byType(NavigationRail), findsNothing);

    await _pumpApp(tester, _sizes['desktop']!);
    expect(find.byType(NavigationRail), findsOneWidget);
    expect(find.byType(NavigationBar), findsNothing);
  });
}
