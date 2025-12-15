import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/features/app/domain/services/app_layout_service.dart';
import 'package:portfolio/features/app/domain/services/app_localization_service.dart';
import 'package:portfolio/features/app/domain/services/app_theme_service.dart';
import 'package:portfolio/features/app/presentation/app_bloc.dart';
import 'package:portfolio/features/app/presentation/app_event.dart';
import 'package:portfolio/features/app/presentation/app_state.dart';
import 'package:result_dart/result_dart.dart';

class MockAppThemeService extends Mock implements AppThemeService {}

class MockAppLocalizationService extends Mock
    implements AppLocalizationService {}

class MockAppLayoutService extends Mock implements AppLayoutService {}

void main() {
  late AppThemeService appThemeService;
  late AppLocalizationService appLocalizationService;
  late AppLayoutService appLayoutService;

  setUpAll(() {
    registerFallbackValue(const Locale('en'));
  });

  setUp(() {
    appThemeService = MockAppThemeService();
    appLocalizationService = MockAppLocalizationService();
    appLayoutService = MockAppLayoutService();

    // Default mock behavior for initialization
    when(() => appThemeService.currentThemeMode).thenReturn(ThemeMode.light);
    when(
      () => appLocalizationService.currentLocalization,
    ).thenReturn(const Locale('en'));
    when(() => appLayoutService.isMobileEnabled).thenReturn(false);

    // Stubs for dispose
    when(() => appThemeService.dispose()).thenReturn(null);
    when(() => appLocalizationService.dispose()).thenReturn(null);
    when(() => appLayoutService.dispose()).thenReturn(null);

    // Stubs for addListener
    when(() => appThemeService.addListener(any())).thenReturn(null);
    when(() => appLocalizationService.addListener(any())).thenReturn(null);
  });

  group('AppBloc', () {
    test('initial state is correct', () {
      final bloc = AppBloc(
        appTheme: appThemeService,
        appLocalization: appLocalizationService,
        appLayoutService: appLayoutService,
      );
      expect(
        bloc.state,
        const AppState(
          Locale('en'),
          ThemeMode.light,
          isMobileLayoutEnabled: false,
        ),
      );
    });

    blocTest<AppBloc, AppState>(
      'emits new theme mode when UpdateThemeEvent is added',
      setUp: () {
        when(() => appThemeService.currentThemeMode).thenReturn(ThemeMode.dark);
      },
      build: () => AppBloc(
        appTheme: appThemeService,
        appLocalization: appLocalizationService,
        appLayoutService: appLayoutService,
      ),
      act: (bloc) => bloc.add(const UpdateThemeEvent()),
      expect: () => [
        const AppState(
          Locale('en'),
          ThemeMode.dark,
          isMobileLayoutEnabled: false,
        ),
      ],
    );

    blocTest<AppBloc, AppState>(
      'calls toggleTheme on ToggleThemeEvent',
      setUp: () {
        when(() => appThemeService.toggleTheme()).thenAnswer((_) async {});
      },
      build: () => AppBloc(
        appTheme: appThemeService,
        appLocalization: appLocalizationService,
        appLayoutService: appLayoutService,
      ),
      act: (bloc) => bloc.add(const ToggleThemeEvent()),
      verify: (_) {
        verify(() => appThemeService.toggleTheme()).called(1);
      },
    );

    blocTest<AppBloc, AppState>(
      'emits new locale when UpdateLocalizationEvent is added',
      setUp: () {
        when(
          () => appLocalizationService.currentLocalization,
        ).thenReturn(const Locale('bg'));
      },
      build: () => AppBloc(
        appTheme: appThemeService,
        appLocalization: appLocalizationService,
        appLayoutService: appLayoutService,
      ),
      act: (bloc) => bloc.add(const UpdateLocalizationEvent()),
      expect: () => [
        const AppState(
          Locale('bg'),
          ThemeMode.light,
          isMobileLayoutEnabled: false,
        ),
      ],
    );

    blocTest<AppBloc, AppState>(
      'calls changeLocale on ToggleLocalizationEvent',
      setUp: () {
        when(
          () => appLocalizationService.changeLocale(any()),
        ).thenAnswer((_) async {});
      },
      build: () => AppBloc(
        appTheme: appThemeService,
        appLocalization: appLocalizationService,
        appLayoutService: appLayoutService,
      ),
      act: (bloc) => bloc.add(const ToggleLocalizationEvent(Locale('bg'))),
      verify: (_) {
        verify(
          () => appLocalizationService.changeLocale(const Locale('bg')),
        ).called(1);
      },
    );

    blocTest<AppBloc, AppState>(
      'calls toggleMobile on ToggleLayoutEvent',
      setUp: () {
        when(
          () => appLayoutService.toggleMobile(
            isMobileLayoutEnabled: any(named: 'isMobileLayoutEnabled'),
          ),
        ).thenAnswer((_) async => Success.unit());
      },
      build: () => AppBloc(
        appTheme: appThemeService,
        appLocalization: appLocalizationService,
        appLayoutService: appLayoutService,
      ),
      act: (bloc) =>
          bloc.add(const ToggleLayoutEvent(isMobileLayoutEnabled: true)),
      verify: (_) {
        verify(
          () => appLayoutService.toggleMobile(isMobileLayoutEnabled: true),
        ).called(1);
      },
    );
  });
}
