import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/core/local_storage/local_storage.dart';
import 'package:portfolio/features/app/data/datasources/local/app_settings_storage.dart';
import 'package:portfolio/features/app/domain/models/app_settings/app_settings.dart';

class MockLocalStorage extends Mock implements LocalStorage {}

void main() {
  late LocalStorage localStorage;
  late AppSettingsStorage appSettingsStorage;

  setUp(() {
    localStorage = MockLocalStorage();
    appSettingsStorage = AppSettingsStorage(localStorage);
  });

  const validAppSettings = AppSettings(
    languageCode: 'en',
    theme: 'system',
    isMobileLayoutEnabled: false,
  );
  final validJson = jsonEncode(validAppSettings.toJson());
  const invalidJson = '{invalid_json}';

  group('AppSettingsStorage', () {
    test('getAppSettings returns settings when json is valid', () {
      when(() => localStorage.getString(any())).thenReturn(validJson);

      final result = appSettingsStorage.getAppSettings();

      expect(result, validAppSettings);
    });

    test('getAppSettings returns null when storage is empty', () {
      when(() => localStorage.getString(any())).thenReturn(null);

      final result = appSettingsStorage.getAppSettings();

      expect(result, null);
    });

    test(
      'getAppSettings deletes string and returns null on FormatException',
      () {
        when(() => localStorage.getString(any())).thenReturn(invalidJson);
        when(
          () => localStorage.deleteString(any()),
        ).thenAnswer((_) async => true);

        final result = appSettingsStorage.getAppSettings();

        expect(result, null);
        verify(() => localStorage.deleteString(any())).called(1);
      },
    );

    test('saveAppSettings returns true on success', () async {
      when(
        () => localStorage.setString(any(), any()),
      ).thenAnswer((_) async => true);

      final result = await appSettingsStorage.saveAppSettings(
        appSettings: validAppSettings,
      );

      expect(result, true);
      verify(() => localStorage.setString(any(), validJson)).called(1);
    });

    test(
      'saveAppSettings returns false when FormatException occurs (mocked)',
      () async {
        when(
          () => localStorage.setString(any(), any()),
        ).thenThrow(const FormatException('mock'));

        final result = await appSettingsStorage.saveAppSettings(
          appSettings: validAppSettings,
        );

        expect(result, false);
      },
    );
  });
}
