import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/features/app/domain/repositories/theme_setting_repo.dart';
import 'package:portfolio/features/app/domain/services/app_theme_service.dart';
import 'package:result_dart/result_dart.dart';

class MockThemeSettingRepo extends Mock implements ThemeSettingRepo {}

void main() {
  late ThemeSettingRepo themeSettingRepo;
  late AppThemeService appThemeService;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    registerFallbackValue(ThemeMode.light);
  });

  setUp(() {
    themeSettingRepo = MockThemeSettingRepo();
    appThemeService = AppThemeService(themeSettingRepo);
  });

  group('AppThemeService', () {
    test('currentThemeMode returns correctly from repo', () {
      when(() => themeSettingRepo.themeMode).thenReturn(ThemeMode.dark);
      expect(appThemeService.currentThemeMode, ThemeMode.dark);
    });

    test('toggleTheme toggles from dark to light', () async {
      // Arrange
      when(() => themeSettingRepo.themeMode).thenReturn(ThemeMode.dark);
      when(
        () => themeSettingRepo.saveTheme(any()),
      ).thenAnswer((_) async => Success.unit());

      // Act
      await appThemeService.toggleTheme();

      // Assert
      verify(() => themeSettingRepo.saveTheme(ThemeMode.light)).called(1);
    });

    test('toggleTheme toggles from light to dark', () async {
      // Arrange
      when(() => themeSettingRepo.themeMode).thenReturn(ThemeMode.light);
      when(
        () => themeSettingRepo.saveTheme(any()),
      ).thenAnswer((_) async => Success.unit());

      // Act
      await appThemeService.toggleTheme();

      // Assert
      verify(() => themeSettingRepo.saveTheme(ThemeMode.dark)).called(1);
    });

    test('switchToSystemTheme switches if current is not system', () async {
      // Arrange
      // In test environment, default brightness is likely light.
      // So System Theme is Light.
      // We set current theme to Dark, so they differ.
      when(() => themeSettingRepo.themeMode).thenReturn(ThemeMode.dark);
      when(
        () => themeSettingRepo.saveTheme(any()),
      ).thenAnswer((_) async => Success.unit());

      // Act
      await appThemeService.switchToSystemTheme();

      // Assert
      verify(() => themeSettingRepo.saveTheme(ThemeMode.system)).called(1);
    });
  });
}
