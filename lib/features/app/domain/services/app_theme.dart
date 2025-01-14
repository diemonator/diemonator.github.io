import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:result_dart/result_dart.dart';

import '../repositories/theme_settings_repo.dart';

final class AppTheme extends ChangeNotifier {
  AppTheme(this._themeSettingsRepo) {
    _currentThemeMode = _initialiseTheme;
  }

  final ThemeSettingsRepo _themeSettingsRepo;
  late ThemeMode _currentThemeMode;

  ThemeMode get themeMode => _currentThemeMode;

  AsyncResult<Unit> toggleTheme() {
    _currentThemeMode = _toggleTheme;

    final brightness = _currentThemeMode == ThemeMode.dark
        ? Brightness.light
        : Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarBrightness: brightness),
    );

    return _themeSettingsRepo
        .saveTheme(_currentThemeMode)
        .onSuccess((_) => notifyListeners());
  }

  AsyncResult<Unit> switchToSystemTheme() async {
    final systemTheme = _currentSystemTheme;

    return _themeSettingsRepo.saveTheme(ThemeMode.system).onSuccess(
      (_) {
        if (systemTheme == _currentThemeMode) {
          return;
        }

        _currentThemeMode = systemTheme;
        notifyListeners();
      },
    );
  }

  ThemeMode get _initialiseTheme {
    final themeMode = _themeSettingsRepo.themeMode;

    if (themeMode == ThemeMode.system) {
      return _currentSystemTheme;
    }

    return themeMode;
  }

  ThemeMode get _currentSystemTheme {
    final platformDispatcher = SchedulerBinding.instance.platformDispatcher;
    final brightness = platformDispatcher.platformBrightness;

    return brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;
  }

  ThemeMode get _toggleTheme {
    return _currentThemeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
  }
}
