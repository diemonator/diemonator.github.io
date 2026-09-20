import 'package:flutter/material.dart';

/// "Ink & Ember": a warm neutral ground with a single ember accent.
///
/// Both schemes are written out rather than seeded, so the neutrals stay warm
/// (seeding tints them toward the accent's hue) and contrast is predictable.
sealed class AppColors {
  static const ColorScheme light = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFB45309),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFFDE9C8),
    onPrimaryContainer: Color(0xFF452A02),
    secondary: Color(0xFF0F766E),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFCCFBF1),
    onSecondaryContainer: Color(0xFF042F2A),
    tertiary: Color(0xFF6D28D9),
    onTertiary: Color(0xFFFFFFFF),
    error: Color(0xFFB91C1C),
    onError: Color(0xFFFFFFFF),
    surface: Color(0xFFFAF9F7),
    onSurface: Color(0xFF1C1A17),
    onSurfaceVariant: Color(0xFF5C574F),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    surfaceContainerLow: Color(0xFFF5F3EF),
    surfaceContainer: Color(0xFFEFECE6),
    surfaceContainerHigh: Color(0xFFE9E5DE),
    surfaceContainerHighest: Color(0xFFE3DED5),
    outline: Color(0xFFD6D1C8),
    outlineVariant: Color(0xFFE8E4DC),
    inverseSurface: Color(0xFF1C1A17),
    onInverseSurface: Color(0xFFF5F3F0),
    inversePrimary: Color(0xFFFBBF24),
  );

  static const ColorScheme dark = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFFBBF24),
    onPrimary: Color(0xFF231A05),
    primaryContainer: Color(0xFF4A3609),
    onPrimaryContainer: Color(0xFFFDE9B4),
    secondary: Color(0xFF7DD3C0),
    onSecondary: Color(0xFF06302A),
    secondaryContainer: Color(0xFF0B4A42),
    onSecondaryContainer: Color(0xFFCCFBF1),
    tertiary: Color(0xFFC4B5FD),
    onTertiary: Color(0xFF2E1065),
    error: Color(0xFFF87171),
    onError: Color(0xFF450A0A),
    surface: Color(0xFF12110F),
    onSurface: Color(0xFFF5F3F0),
    onSurfaceVariant: Color(0xFFA8A29A),
    surfaceContainerLowest: Color(0xFF0C0B0A),
    surfaceContainerLow: Color(0xFF171613),
    surfaceContainer: Color(0xFF1C1B18),
    surfaceContainerHigh: Color(0xFF24221E),
    surfaceContainerHighest: Color(0xFF2C2925),
    outline: Color(0xFF3A3733),
    outlineVariant: Color(0xFF26241F),
    inverseSurface: Color(0xFFF5F3F0),
    onInverseSurface: Color(0xFF1C1A17),
    inversePrimary: Color(0xFFB45309),
  );
}
