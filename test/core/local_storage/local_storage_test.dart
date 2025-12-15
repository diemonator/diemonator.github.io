import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/core/local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late SharedPreferences mockPrefs;
  late LocalStorage localStorage;

  setUp(() {
    mockPrefs = MockSharedPreferences();
    localStorage = LocalStorage(mockPrefs);
  });

  group('LocalStorage', () {
    test('getString returns correct value', () {
      when(() => mockPrefs.getString('key')).thenReturn('value');
      final result = localStorage.getString('key');
      expect(result, 'value');
    });

    test('getString returns null on PlatformException', () {
      when(
        () => mockPrefs.getString(any()),
      ).thenThrow(PlatformException(code: 'error'));
      final result = localStorage.getString('error_key');
      expect(result, null);
    });

    test('setString returns true on success', () async {
      when(
        () => mockPrefs.setString(any(), any()),
      ).thenAnswer((_) async => true);
      final success = await localStorage.setString('key', 'value');
      expect(success, true);
    });

    test('setString returns false on PlatformException', () async {
      when(
        () => mockPrefs.setString(any(), any()),
      ).thenThrow(PlatformException(code: 'error'));
      final success = await localStorage.setString('key', 'value');
      expect(success, false);
    });

    test('deleteString returns true on success', () async {
      when(() => mockPrefs.remove(any())).thenAnswer((_) async => true);
      final success = await localStorage.deleteString('key');
      expect(success, true);
    });

    test('deleteString returns false on PlatformException', () async {
      when(
        () => mockPrefs.remove(any()),
      ).thenThrow(PlatformException(code: 'error'));
      final success = await localStorage.deleteString('key');
      expect(success, false);
    });
  });
}
