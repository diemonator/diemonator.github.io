import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

import '../../domain/models/app_settings/app_settings.dart';
import '../../domain/repositories/app_settings_repo.dart';
import '../../domain/repositories/layout_setting_repo.dart';
import '../../domain/repositories/locale_setting_repo.dart';
import '../../domain/repositories/theme_setting_repo.dart';
import '../datasources/local/app_settings_storage.dart';

class AppSettingsRepoImpl
    implements
        AppSettingsRepo,
        ThemeSettingRepo,
        LocaleSettingRepo,
        LayoutSettingRepo {
  AppSettingsRepoImpl(this._localStorage, this._appSettings);

  final AppSettingsStorage _localStorage;
  AppSettings _appSettings;

  @override
  Locale get locale => _appSettings.localeDate;

  @override
  ThemeMode get themeMode => _appSettings.themeState;

  @override
  bool get isMobileLayoutEnabled => _appSettings.isMobileLayoutEnabled;

  @override
  AppSettings get appSettings => _appSettings;

  @override
  AsyncResult<Unit> saveAppSettings(AppSettings appSettings) {
    _appSettings = appSettings;

    return _saveAppSettings(_appSettings);
  }

  @override
  AsyncResult<Unit> saveLocale(Locale localeData) {
    _appSettings = _appSettings.copyWith(
      languageCode: localeData.languageCode,
      countryCode: localeData.countryCode,
      scriptCode: localeData.scriptCode,
    );

    return _saveAppSettings(_appSettings);
  }

  @override
  AsyncResult<Unit> saveTheme(ThemeMode themeMode) {
    _appSettings = _appSettings.copyWith(theme: themeMode.name);

    return _saveAppSettings(_appSettings);
  }

  @override
  AsyncResult<Unit> saveLayoutSetting({required bool isMobileLayoutEnabled}) {
    _appSettings = _appSettings.copyWith(
      isMobileLayoutEnabled: isMobileLayoutEnabled,
    );

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
