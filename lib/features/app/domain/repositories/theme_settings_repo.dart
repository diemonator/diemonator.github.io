import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class ThemeSettingsRepo {
  ThemeMode get themeMode;

  AsyncResult<Unit> saveTheme(ThemeMode themeMode);
}
