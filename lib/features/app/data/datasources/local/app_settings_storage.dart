import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../core/local_storage/local_storage.dart';
import '../../../domain/models/app_settings/app_settings.dart';

const String _appSettingsKey = 'app_settings';

final class AppSettingsStorage {
  const AppSettingsStorage(this._localStorage);

  final LocalStorage _localStorage;

  ThemeMode get themeState => appSettings.themeState;

  Locale get localeData => appSettings.localeDate;

  AppSettings get appSettings {
    try {
      final jsonText = _localStorage.getString(_appSettingsKey) ?? '';

      if (jsonText.isNotEmpty) {
        final json = jsonDecode(jsonText) as Map<String, dynamic>;

        return AppSettings.fromJson(json);
      }
    } on FormatException {
      _localStorage.deleteString(_appSettingsKey);
    }

    return AppSettings.empty();
  }

  Future<bool> saveAppSettings({required AppSettings appSettings}) async {
    try {
      final json = appSettings.toJson();
      final jsonText = jsonEncode(json);

      return _localStorage.setString(_appSettingsKey, jsonText);
    } on FormatException catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
    }

    return false;
  }
}
