import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../core/utilities/theme_utilities.dart';
import '../repositories/theme_setting_repo.dart';

class AppThemeService extends ChangeNotifier {
  AppThemeService(this._themeSettingsRepo);

  final ThemeSettingRepo _themeSettingsRepo;

  ThemeMode get currentThemeMode => _themeSettingsRepo.themeMode;

  Future<void> toggleTheme() {
    final (mode, brightness) = currentThemeMode == ThemeMode.dark
        ? (ThemeMode.light, Brightness.light)
        : (ThemeMode.dark, Brightness.dark);

    return _themeSettingsRepo.saveTheme(mode).onSuccess((_) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarBrightness: brightness),
      );
      notifyListeners();
    });
  }

  Future<void> switchToSystemTheme() async {
    if (ThemeUtilities.systemTheme != currentThemeMode) {
      await _themeSettingsRepo
          .saveTheme(ThemeMode.system)
          .onSuccess((_) => notifyListeners());
    }
  }
}
