import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/services/app_localization.dart';
import '../domain/services/app_theme.dart';
import 'app_state.dart';

final class AppCubit extends Cubit<AppState> {
  AppCubit({
    required final AppTheme appTheme,
    required final AppLocalization appLocalization,
  })  : _appTheme = appTheme,
        _appLocalization = appLocalization,
        super(
          AppState(appLocalization.currentLocalization, appTheme.themeMode),
        ) {
    _appTheme.addListener(_updateThemeMode);
    _appLocalization.addListener(_updateAppLocalization);
  }

  final AppTheme _appTheme;
  final AppLocalization _appLocalization;

  Future<void> toggleTheme() async {
    await _appTheme.toggleTheme();
  }

  void _updateThemeMode() {
    final newState = state.copyWith(
      themeMode: _appTheme.themeMode,
    );

    emit(newState);
  }

  void _updateAppLocalization() {
    final newState = state.copyWith(
      locale: _appLocalization.currentLocalization,
    );

    emit(newState);
  }

  @override
  Future<void> close() {
    _appTheme.removeListener(_updateThemeMode);
    _appLocalization.removeListener(_updateAppLocalization);
    return super.close();
  }
}
