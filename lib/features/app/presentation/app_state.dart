import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppState extends Equatable {
  const AppState(
    this.locale,
    this.themeMode, {
    required this.isMobileLayoutEnabled,
  });

  final ThemeMode themeMode;
  final Locale locale;
  final bool isMobileLayoutEnabled;

  AppState copyWith({
    Locale? locale,
    ThemeMode? themeMode,
    bool? isMobileLayoutEnabled,
  }) {
    return AppState(
      locale ?? this.locale,
      themeMode ?? this.themeMode,
      isMobileLayoutEnabled:
          isMobileLayoutEnabled ?? this.isMobileLayoutEnabled,
    );
  }

  @override
  List<Object?> get props => [locale, themeMode, isMobileLayoutEnabled];
}
