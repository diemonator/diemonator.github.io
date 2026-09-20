import 'dart:ui';

sealed class AppEvent {
  const AppEvent();
}

final class ToggleThemeEvent extends AppEvent {
  const ToggleThemeEvent();
}

final class ToggleLocalizationEvent extends AppEvent {
  const ToggleLocalizationEvent(this.locale);

  final Locale locale;
}

final class ToggleLayoutEvent extends AppEvent {
  const ToggleLayoutEvent({required this.isMobileLayoutEnabled});

  final bool isMobileLayoutEnabled;
}

final class UpdateThemeEvent extends AppEvent {
  const UpdateThemeEvent();
}

final class UpdateLocalizationEvent extends AppEvent {
  const UpdateLocalizationEvent();
}

final class UpdateLayoutEvent extends AppEvent {
  const UpdateLayoutEvent();
}
