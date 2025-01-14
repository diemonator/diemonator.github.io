import 'package:flutter/material.dart';

class AppState {
  const AppState(this.locale, this.themeMode);

  final ThemeMode themeMode;
  final Locale locale;

  AppState copyWith({Locale? locale, ThemeMode? themeMode}) {
    return AppState(locale ?? this.locale, themeMode ?? this.themeMode);
  }
}
