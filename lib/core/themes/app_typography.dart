import 'package:flutter/material.dart';

/// Editorial type scale: tight, heavy display sizes over a comfortable body.
///
/// Uses the platform's own font stack rather than a webfont dependency, so the
/// weights below are what carries the personality.
sealed class AppTypography {
  /// [compact] shrinks only the display/headline tiers — body text stays put,
  /// because scaling it down is what made the old `textScale` hard to read.
  static TextTheme of({required bool compact}) {
    final displayScale = compact ? 0.62 : 1.0;
    final headlineScale = compact ? 0.78 : 1.0;

    return TextTheme(
      displayLarge: _display(57 * displayScale),
      displayMedium: _display(45 * displayScale),
      displaySmall: _display(36 * displayScale),
      headlineLarge: _headline(32 * headlineScale),
      headlineMedium: _headline(28 * headlineScale),
      headlineSmall: _headline(24 * headlineScale),
      titleLarge: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.3,
        letterSpacing: -0.1,
      ),
      titleMedium: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.4,
      ),
      titleSmall: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.4,
      ),
      bodyLarge: const TextStyle(fontSize: 17, height: 1.6),
      bodyMedium: const TextStyle(fontSize: 15, height: 1.6),
      bodySmall: const TextStyle(fontSize: 13, height: 1.5),
      labelLarge: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
      ),
      labelMedium: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.4,
      ),
      // Small caps-ish eyebrow labels above section titles.
      labelSmall: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
    );
  }

  static TextStyle _display(double size) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w800,
      height: 1.05,
      letterSpacing: -size * 0.025,
    );
  }

  static TextStyle _headline(double size) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w700,
      height: 1.2,
      letterSpacing: -size * 0.015,
    );
  }
}
