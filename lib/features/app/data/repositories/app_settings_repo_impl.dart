import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

import '../../domain/models/app_settings/app_settings.dart';
import '../../domain/repositories/locale_settings_repo.dart';
import '../../domain/repositories/theme_settings_repo.dart';
import '../datasources/local/app_settings_storage.dart';

class AppSettingsRepoImpl implements ThemeSettingsRepo, LocaleSettingsRepo {
  AppSettingsRepoImpl(this._localStorage)
      : _appSettings = _localStorage.appSettings;

  final AppSettingsStorage _localStorage;
  AppSettings _appSettings;

  @override
  Locale get locale => _localStorage.localeData;

  @override
  ThemeMode get themeMode => _localStorage.themeState;

  @override
  AsyncResult<Unit> saveLocale(Locale localeData) async {
    _appSettings = _appSettings.copyWith(
      languageCode: localeData.languageCode,
      countryCode: localeData.countryCode,
      scriptCode: localeData.scriptCode,
    );

    return _saveAppSettings(_appSettings);
  }

  @override
  AsyncResult<Unit> saveTheme(ThemeMode themeMode) async {
    _appSettings = _appSettings.copyWith(theme: themeMode.name);

    return _saveAppSettings(_appSettings);
  }

  AsyncResult<Unit> _saveAppSettings(AppSettings appSettings) async {
    try {
      final result = await _localStorage.saveAppSettings(
        appSettings: appSettings,
      );

      if (result) {
        return Success.unit();
      }
    } on Exception catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
    }

    return Failure(Exception('Failed to save app settings'));
  }
}