import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

@freezed
class AppSettings with _$AppSettings {
  const factory AppSettings({
    required final String languageCode,
    required final String theme,
    final String? scriptCode,
    final String? countryCode,
  }) = _AppSettings;

  factory AppSettings.empty() => _AppSettings(
        languageCode: AppLocalizations.supportedLocales.first.languageCode,
        theme: ThemeMode.system.name,
      );

  factory AppSettings.fromJson(Map<String, Object?> json) =>
      _$AppSettingsFromJson(json);

  const AppSettings._();

  ThemeMode get themeState => ThemeMode.values.byName(theme);

  Locale get localeDate => Locale(languageCode, countryCode);
}