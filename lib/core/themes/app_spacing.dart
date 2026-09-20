/// One spacing scale for the whole app, so padding is picked from a set of
/// eight values instead of invented per widget.
sealed class AppSpacing {
  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
  static const double xxxl = 64;

  /// Corner radii. Flat-but-soft: nothing fully rounded except avatars.
  static const double radiusSm = 8;
  static const double radiusMd = 12;
  static const double radiusLg = 20;
}
