import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/features/app/data/datasources/local/app_settings_storage.dart';
import 'package:portfolio/features/app/data/repositories/app_settings_repo_impl.dart';
import 'package:portfolio/features/app/domain/models/app_settings/app_settings.dart';

class MockAppSettingsStorage extends Mock implements AppSettingsStorage {}

void main() {
  late AppSettingsStorage appSettingsStorage;
  late AppSettingsRepoImpl appSettingsRepo;

  const defaultAppSettings = AppSettings(
    languageCode: 'en',
    theme: 'system',
    isMobileLayoutEnabled: false,
  );

  setUp(() {
    appSettingsStorage = MockAppSettingsStorage();
    appSettingsRepo = AppSettingsRepoImpl(
      appSettingsStorage,
      defaultAppSettings,
    );
    registerFallbackValue(defaultAppSettings);
  });

  group('AppSettingsRepoImpl', () {
    test('saveLocale updates settings and saves to storage', () async {
      // Arrange
      const newLocale = Locale('bg');
      when(
        () => appSettingsStorage.saveAppSettings(
          appSettings: any(named: 'appSettings'),
        ),
      ).thenAnswer((_) async => true);

      // Act
      final result = await appSettingsRepo.saveLocale(newLocale);

      // Assert
      expect(result.isSuccess(), true);
      expect(appSettingsRepo.locale.languageCode, 'bg');
      verify(
        () => appSettingsStorage.saveAppSettings(
          appSettings: any(
            named: 'appSettings',
            that: isA<AppSettings>().having(
              (s) => s.languageCode,
              'languageCode',
              'bg',
            ),
          ),
        ),
      ).called(1);
    });

    test('saveTheme updates settings and saves to storage', () async {
      // Arrange
      const newTheme = ThemeMode.dark;
      when(
        () => appSettingsStorage.saveAppSettings(
          appSettings: any(named: 'appSettings'),
        ),
      ).thenAnswer((_) async => true);

      // Act
      final result = await appSettingsRepo.saveTheme(newTheme);

      // Assert
      expect(result.isSuccess(), true);
      expect(appSettingsRepo.themeMode, ThemeMode.dark);
      verify(
        () => appSettingsStorage.saveAppSettings(
          appSettings: any(
            named: 'appSettings',
            that: isA<AppSettings>().having((s) => s.theme, 'theme', 'dark'),
          ),
        ),
      ).called(1);
    });

    test('saveLayoutSetting updates settings and saves to storage', () async {
      // Arrange
      when(
        () => appSettingsStorage.saveAppSettings(
          appSettings: any(named: 'appSettings'),
        ),
      ).thenAnswer((_) async => true);

      // Act
      final result = await appSettingsRepo.saveLayoutSetting(
        isMobileLayoutEnabled: true,
      );

      // Assert
      expect(result.isSuccess(), true);
      expect(appSettingsRepo.isMobileLayoutEnabled, true);
      verify(
        () => appSettingsStorage.saveAppSettings(
          appSettings: any(
            named: 'appSettings',
            that: isA<AppSettings>().having(
              (s) => s.isMobileLayoutEnabled,
              'isMobileLayoutEnabled',
              true,
            ),
          ),
        ),
      ).called(1);
    });

    test('returns failure when storage fails', () async {
      // Arrange
      when(
        () => appSettingsStorage.saveAppSettings(
          appSettings: any(named: 'appSettings'),
        ),
      ).thenAnswer((_) async => false);

      // Act
      final result = await appSettingsRepo.saveTheme(ThemeMode.dark);

      // Assert
      expect(result.isError(), true);
    });

    test('returns failure when storage throws exception', () async {
      // Arrange
      when(
        () => appSettingsStorage.saveAppSettings(
          appSettings: any(named: 'appSettings'),
        ),
      ).thenThrow(Exception('Storage error'));

      // Act
      final result = await appSettingsRepo.saveTheme(ThemeMode.dark);

      // Assert
      expect(result.isError(), true);
    });

    test('appSettings getter returns current settings', () {
      expect(appSettingsRepo.appSettings, defaultAppSettings);
    });

    test('saveAppSettings updates settings and saves', () async {
      // Arrange
      const newSettings = AppSettings(
        languageCode: 'bg',
        theme: 'light',
        isMobileLayoutEnabled: true,
      );
      when(
        () => appSettingsStorage.saveAppSettings(
          appSettings: any(named: 'appSettings'),
        ),
      ).thenAnswer((_) async => true);

      // Act
      final result = await appSettingsRepo.saveAppSettings(newSettings);

      // Assert
      expect(result.isSuccess(), true);
      expect(appSettingsRepo.appSettings, newSettings);
      verify(
        () => appSettingsStorage.saveAppSettings(appSettings: newSettings),
      ).called(1);
    });
  });
}
