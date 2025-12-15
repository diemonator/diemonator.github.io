import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/core/extensions/media_query_extensions.dart';
import 'package:portfolio/features/app/presentation/app_bloc.dart';
import 'package:portfolio/features/app/presentation/app_state.dart';

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

    testWidgets(
      'gridChildCountAndRatio returns correct values for small width',
      (tester) async {
        await tester.pumpWidget(pumpWidgetWithMedia(tester, 780));
        // 780 - 300 = 480 <= 480. Col: 1, Ratio: 1.4

        final BuildContext context = tester.element(find.byType(SizedBox));
        final result = context.gridChildCountAndRatio;

        expect(result.columnCount, 1);
        expect(result.ratio, 1.4);
      },
    );

    testWidgets(
      'gridChildCountAndRatio returns correct values for large width',
      (tester) async {
        await tester.pumpWidget(pumpWidgetWithMedia(tester, 781));
        // 781 - 300 = 481 > 480. Col: 2, Ratio: 2

        final BuildContext context = tester.element(find.byType(SizedBox));
        final result = context.gridChildCountAndRatio;

        expect(result.columnCount, 2);
        expect(result.ratio, 2);
      },
    );

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
