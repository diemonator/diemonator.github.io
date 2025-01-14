import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/services/app_layout_service.dart';
import '../domain/services/app_localization_service.dart';
import '../domain/services/app_theme_service.dart';
import 'app_state.dart';

final class AppCubit extends Cubit<AppState> {
  AppCubit({
    required final AppThemeService appTheme,
    required final AppLocalizationService appLocalization,
    required final AppLayoutService appLayoutService,
  })  : _appTheme = appTheme,
        _appLocalization = appLocalization,
        _appLayoutService = appLayoutService,
        super(
          AppState(
            appLocalization.currentLocalization,
            appTheme.currentThemeMode,
            isMobileLayoutEnabled: appLayoutService.isMobileEnabled,
          ),
        ) {
    _appTheme.addListener(_updateThemeMode);
    _appLocalization.addListener(_updateAppLocalization);
    _appLayoutService.addListener(_updateAppLayout);
  }

  final AppThemeService _appTheme;
  final AppLocalizationService _appLocalization;
  final AppLayoutService _appLayoutService;

  Future<void> toggleLayout({required bool isMobileLayoutEnabled}) {
    return _appLayoutService.toggleMobile(
      isMobileLayoutEnabled: isMobileLayoutEnabled,
    );
  }

  Future<void> toggleTheme() {
    return _appTheme.toggleTheme();
  }

  Future<void> toggleLocalization(Locale locale) {
    return _appLocalization.changeLocale(locale);
  }

  void _updateThemeMode() {
    final newState = state.copyWith(
      themeMode: _appTheme.currentThemeMode,
    );

    emit(newState);
  }

  void _updateAppLocalization() {
    final newState = state.copyWith(
      locale: _appLocalization.currentLocalization,
    );

    emit(newState);
  }

  void _updateAppLayout() {
    final newState = state.copyWith(
      isMobileLayoutEnabled: _appLayoutService.isMobileEnabled,
    );

    emit(newState);
  }

  @override
  Future<void> close() {
    _appTheme
      ..removeListener(_updateThemeMode)
      ..dispose();
    _appLocalization
      ..removeListener(_updateAppLocalization)
      ..dispose();
    _appLayoutService
      ..removeListener(_updateAppLayout)
      ..dispose();

    return super.close();
  }
}
