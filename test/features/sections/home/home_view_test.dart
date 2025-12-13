import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/core/di/locator.dart';
import 'package:portfolio/core/localization/generated/app_localizations.dart';
import 'package:portfolio/features/app/presentation/app_bloc.dart';
import 'package:portfolio/features/sections/home/home_view.dart';
import 'package:portfolio/features/sections/home/widgets/introduction_card.dart';
import 'package:portfolio/features/sections/home/widgets/technology_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() async {
    await GetIt.I.reset();
    SharedPreferences.setMockInitialValues({});
    await locator.initLocator();
  });

  testWidgets('HomeView renders correctly', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      BlocProvider<AppBloc>(
        create: (context) => locator.get(),
        child: const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(body: HomeView()),
        ),
      ),
    );

    // Act
    await tester.pumpAndSettle();

    // Assert
    expect(find.byType(IntroductionCard), findsOneWidget);
    expect(find.byType(TechnologyCard), findsNWidgets(2));
  });
}
