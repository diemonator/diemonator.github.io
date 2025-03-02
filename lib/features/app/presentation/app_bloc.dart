import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/services/app_layout_service.dart';
import '../domain/services/app_localization_service.dart';
import '../domain/services/app_theme_service.dart';
import 'app_event.dart';
import 'app_state.dart';

final class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
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
    on<ToggleThemeEvent>(_onToggleTheme);
    on<ToggleLocalizationEvent>(_onToggleLocalization);
    on<ToggleLayoutEvent>(_onToggleLayout);
    on<UpdateThemeEvent>(_onUpdateTheme);
    on<UpdateLocalizationEvent>(_onUpdateLocalization);

    _appTheme.addListener(() => add(const UpdateThemeEvent()));
    _appLocalization.addListener(() => add(const UpdateLocalizationEvent()));
  }

  final AppThemeService _appTheme;
  final AppLocalizationService _appLocalization;
  final AppLayoutService _appLayoutService;

  Future<void> _onToggleTheme(
    ToggleThemeEvent event,
    Emitter<AppState> emit,
  ) {
    return _appTheme.toggleTheme();
  }

  Future<void> _onToggleLocalization(
    ToggleLocalizationEvent event,
    Emitter<AppState> emit,
  ) {
    return _appLocalization.changeLocale(event.locale);
  }

  /// Should not emit as it breaks context application
  /// Must refresh page rather to rebuild widget
  Future<void> _onToggleLayout(
    ToggleLayoutEvent event,
    Emitter<AppState> emit,
  ) {
    return _appLayoutService.toggleMobile(
      isMobileLayoutEnabled: event.isMobileLayoutEnabled,
    );
  }

  void _onUpdateTheme(UpdateThemeEvent event, Emitter<AppState> emit) {
    emit(state.copyWith(themeMode: _appTheme.currentThemeMode));
  }

  void _onUpdateLocalization(
    UpdateLocalizationEvent event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(locale: _appLocalization.currentLocalization));
  }

  @override
  Future<void> close() {
    _appTheme.dispose();
    _appLocalization.dispose();
    _appLayoutService.dispose();

    return super.close();
  }
}
