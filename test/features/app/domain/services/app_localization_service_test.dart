import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/features/app/domain/repositories/locale_setting_repo.dart';
import 'package:portfolio/features/app/domain/services/app_localization_service.dart';
import 'package:result_dart/result_dart.dart';

class MockLocaleSettingRepo extends Mock implements LocaleSettingRepo {}

void main() {
  late LocaleSettingRepo localeSettingRepo;
  late AppLocalizationService appLocalizationService;

  setUpAll(() {
    registerFallbackValue(const Locale('en'));
  });

  setUp(() {
    localeSettingRepo = MockLocaleSettingRepo();
    appLocalizationService = AppLocalizationService(localeSettingRepo);
  });

  group('AppLocalizationService', () {
    test('currentLocalization returns correctly from repo', () {
      when(() => localeSettingRepo.locale).thenReturn(const Locale('en'));
      expect(appLocalizationService.currentLocalization, const Locale('en'));
    });

    test('changeLocale calls saveLocale when locale is different', () async {
      // Arrange
      when(() => localeSettingRepo.locale).thenReturn(const Locale('en'));
      when(
        () => localeSettingRepo.saveLocale(any()),
      ).thenAnswer((_) async => Success.unit());

      // Act
      await appLocalizationService.changeLocale(const Locale('bg'));

      // Assert
      verify(() => localeSettingRepo.saveLocale(const Locale('bg'))).called(1);
    });

    test('changeLocale does NOT call saveLocale when locale is same', () async {
      // Arrange
      when(() => localeSettingRepo.locale).thenReturn(const Locale('en'));

      // Act
      await appLocalizationService.changeLocale(const Locale('en'));

      // Assert
      verifyNever(() => localeSettingRepo.saveLocale(any()));
    });
  });
}
