import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/core/extensions/nav_items_extensions.dart';
import 'package:portfolio/core/localization/generated/app_localizations.dart';
import 'package:portfolio/core/navigation/app_routes.dart';

void main() {
  group('NavItemsExtensions', () {
    testWidgets('getLocalizedNavItemLabel returns correct labels', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('en'),
          home: Builder(
            builder: (context) {
              final homeLabel = context.getLocalizedNavItemLabel(
                AppRoutes.home,
              );
              final portfolioLabel = context.getLocalizedNavItemLabel(
                AppRoutes.portfolio,
              );
              return Column(
                children: [
                  Text('Home: $homeLabel'),
                  Text('Portfolio: $portfolioLabel'),
                ],
              );
            },
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.textContaining('Home: Home'), findsOneWidget);
      expect(
        find.textContaining('Portfolio:'),
        findsOneWidget,
      ); // Portfolio or Projects

      // Add missing cases
      await tester.tap(find.byType(Column)); // Just to interact? No.

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('en'),
          home: Builder(
            builder: (context) {
              final profile = context.getLocalizedNavItemLabel(
                AppRoutes.profile,
              );
              final contacts = context.getLocalizedNavItemLabel(
                AppRoutes.contacts,
              );
              return Column(
                children: [
                  Text('Profile: $profile'),
                  Text('Contacts: $contacts'),
                ],
              );
            },
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.textContaining('Profile:'), findsOneWidget);
      expect(find.textContaining('Contacts:'), findsOneWidget);
    });

    testWidgets('navRailItems generates correct list', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (context) {
              final items = context.navRailItems;
              return Text('RailItems: ${items.length}');
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('RailItems: ${AppRoutes.tabs.length}'), findsOneWidget);
    });

    testWidgets('navBarItems generates correct list', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (context) {
              final items = context.navBarItems;
              return Text('Items: ${items.length}');
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Items: ${AppRoutes.tabs.length}'), findsOneWidget);
    });
  });
}
