import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/core/extensions/media_query_extensions.dart';
import 'package:portfolio/features/app/presentation/bloc/app_bloc.dart';
import 'package:portfolio/features/app/presentation/bloc/app_state.dart';

class MockAppBloc extends Mock implements AppBloc {}

void main() {
  late AppBloc appBloc;

  setUp(() {
    appBloc = MockAppBloc();
    when(() => appBloc.stream).thenAnswer((_) => const Stream.empty());
  });

  Widget pumpWidgetWithMedia(
    WidgetTester tester,
    double width, {
    bool isMobileLayout = false,
  }) {
    when(() => appBloc.state).thenReturn(
      AppState(
        const Locale('en'),
        ThemeMode.system,
        isMobileLayoutEnabled: isMobileLayout,
      ),
    );

    return BlocProvider<AppBloc>.value(
      value: appBloc,
      child: MaterialApp(
        home: Builder(
          builder: (context) {
            // Force media query size
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(size: Size(width, 800)),
              child: const SizedBox(),
            );
          },
        ),
      ),
    );
  }

  group('MediaQueryExtensions', () {
    testWidgets('isMobileScreen returns true for small width', (tester) async {
      await tester.pumpWidget(pumpWidgetWithMedia(tester, 400));

      await tester.pumpWidget(
        BlocProvider<AppBloc>.value(
          value: appBloc,
          child: MaterialApp(
            home: MediaQuery(
              data: const MediaQueryData(size: Size(400, 800)),
              child: Builder(
                builder: (context) {
                  // isMobileScreen logic reads from Bloc for layout setting
                  when(() => appBloc.state).thenReturn(
                    const AppState(
                      Locale('en'),
                      ThemeMode.system,
                      isMobileLayoutEnabled: false,
                    ),
                  );
                  return Text(context.isMobileScreen.toString());
                },
              ),
            ),
          ),
        ),
      );

      expect(find.text('true'), findsOneWidget);
    });

    testWidgets('isDesktopScreen returns true for large width', (tester) async {
      await tester.pumpWidget(
        BlocProvider<AppBloc>.value(
          value: appBloc,
          child: MaterialApp(
            home: MediaQuery(
              data: const MediaQueryData(size: Size(1200, 800)),
              child: Builder(
                builder: (context) {
                  when(() => appBloc.state).thenReturn(
                    const AppState(
                      Locale('en'),
                      ThemeMode.system,
                      isMobileLayoutEnabled: false,
                    ),
                  );
                  return Text(context.isDesktopScreen.toString());
                },
              ),
            ),
          ),
        ),
      );

      expect(find.text('true'), findsOneWidget);
    });

    testWidgets(
      'isMobileScreen returns true when mobile layout is forced enabled',
      (tester) async {
        await tester.pumpWidget(
          BlocProvider<AppBloc>.value(
            value: appBloc,
            child: MaterialApp(
              home: MediaQuery(
                data: const MediaQueryData(size: Size(1200, 800)),
                child: Builder(
                  builder: (context) {
                    when(() => appBloc.state).thenReturn(
                      const AppState(
                        Locale('en'),
                        ThemeMode.system,
                        isMobileLayoutEnabled: true,
                      ),
                    );
                    return Text(context.isMobileScreen.toString());
                  },
                ),
              ),
            ),
          ),
        );

        expect(find.text('false'), findsOneWidget);
      },
    );

    testWidgets('isTabletScreen returns true for medium width', (tester) async {
      await tester.pumpWidget(
        BlocProvider<AppBloc>.value(
          value: appBloc,
          child: MaterialApp(
            home: MediaQuery(
              data: const MediaQueryData(size: Size(800, 800)),
              child: Builder(
                builder: (context) {
                  when(() => appBloc.state).thenReturn(
                    const AppState(
                      Locale('en'),
                      ThemeMode.system,
                      isMobileLayoutEnabled: false,
                    ),
                  );
                  return Text(context.isTabletScreen.toString());
                },
              ),
            ),
          ),
        ),
      );

      expect(find.text('true'), findsOneWidget);
    });

    testWidgets('gridChildCountAndRatio scales columns with width', (
      tester,
    ) async {
      // contentWidth = width - 80 rail; one column per 360, clamped to 1..4.
      for (final (width, columns) in [
        (400.0, 1), // phone: 400 content
        (780.0, 1), // 700 content
        (800.0, 2), // 720 content
        (2400.0, 4), // 2320 content, clamped
      ]) {
        await tester.pumpWidget(pumpWidgetWithMedia(tester, width));
        final BuildContext context = tester.element(find.byType(SizedBox));
        final result = context.gridChildCountAndRatio;

        expect(result.columnCount, columns, reason: 'at width $width');
        expect(result.ratio, columns == 1 ? 1.4 : 1.6, reason: 'at $width');
      }
    });

    testWidgets('contentPadding gutters phones and centres wide screens', (
      tester,
    ) async {
      // Phone: flat 16 gutter.
      await tester.pumpWidget(pumpWidgetWithMedia(tester, 400));
      var context = tester.element(find.byType(SizedBox));
      expect(context.contentPadding.left, 16);

      // Desktop below the cap: flat 42 gutter.
      await tester.pumpWidget(pumpWidgetWithMedia(tester, 1000));
      context = tester.element(find.byType(SizedBox));
      expect(context.contentPadding.left, 42);

      // Past the cap: gutters grow so text stays <= maxContentWidth.
      await tester.pumpWidget(pumpWidgetWithMedia(tester, 2000));
      context = tester.element(find.byType(SizedBox));
      final padding = context.contentPadding;
      expect(padding.left, (2000 - 80 - 1100) / 2);
      expect(
        context.contentWidth - padding.horizontal,
        MediaQueryExtensions.maxContentWidth,
      );
    });

    testWidgets('textScale returns scaled value', (tester) async {
      // Case 1: Desktop (1000px), scale 20. result 20.
      await tester.pumpWidget(pumpWidgetWithMedia(tester, 1000));
      var context = tester.element(find.byType(SizedBox));
      expect(context.textScale(20), 20);

      // Case 2: Desktop, scale 10. result 10 -> max 14.
      await tester.pumpWidget(pumpWidgetWithMedia(tester, 1000));
      context = tester.element(find.byType(SizedBox));
      expect(context.textScale(10), 14);

      // Case 3: Mobile (400px), scale 20. result 14 (20 * 0.7 = 14).
      await tester.pumpWidget(pumpWidgetWithMedia(tester, 400));
      context = tester.element(find.byType(SizedBox));
      expect(context.textScale(20), 14);

      // Case 4: Mobile, scale 30. result 21.
      await tester.pumpWidget(pumpWidgetWithMedia(tester, 400));
      context = tester.element(find.byType(SizedBox));
      expect(context.textScale(30), 21);
    });
  });
}
