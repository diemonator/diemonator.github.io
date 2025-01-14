import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

sealed class ThemeUtilities {
  static ThemeMode get systemTheme {
    final platformDispatcher = SchedulerBinding.instance.platformDispatcher;
    final brightness = platformDispatcher.platformBrightness;

    return brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;
  }
}
