import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

/// Builds the app theme. [compact] drives the display type scale, so the
/// phone layout gets smaller headlines without per-widget font-size branching.
ThemeData buildTheme({required Brightness brightness, required bool compact}) {
  final colors = brightness == Brightness.dark
      ? AppColors.dark
      : AppColors.light;
  final text = AppTypography.of(compact: compact)
      .apply(bodyColor: colors.onSurface, displayColor: colors.onSurface);

  return ThemeData(
    colorScheme: colors,
    textTheme: text,
    scaffoldBackgroundColor: colors.surface,
    // Flat by default: separation comes from hairlines and surface tints
    // rather than shadows, which read as muddy on the warm dark ground.
    cardTheme: CardThemeData(
      elevation: 0,
      color: colors.surfaceContainerLow,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        side: BorderSide(color: colors.outlineVariant),
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: colors.surface,
      foregroundColor: colors.onSurface,
      centerTitle: false,
      titleTextStyle: text.titleLarge,
    ),
    navigationBarTheme: NavigationBarThemeData(
      elevation: 0,
      height: 68,
      backgroundColor: colors.surfaceContainerLow,
      indicatorColor: colors.primaryContainer,
      labelTextStyle: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? text.labelMedium?.copyWith(color: colors.onSurface)
            : text.labelMedium?.copyWith(color: colors.onSurfaceVariant),
      ),
      iconTheme: WidgetStateProperty.resolveWith(
        (states) => IconThemeData(
          size: 24,
          color: states.contains(WidgetState.selected)
              ? colors.onPrimaryContainer
              : colors.onSurfaceVariant,
        ),
      ),
    ),
    navigationRailTheme: NavigationRailThemeData(
      elevation: 0,
      backgroundColor: colors.surface,
      indicatorColor: colors.primaryContainer,
      selectedLabelTextStyle: text.labelMedium?.copyWith(
        color: colors.onSurface,
      ),
      unselectedLabelTextStyle: text.labelMedium?.copyWith(
        color: colors.onSurfaceVariant,
      ),
      selectedIconTheme: IconThemeData(color: colors.onPrimaryContainer),
      unselectedIconTheme: IconThemeData(color: colors.onSurfaceVariant),
    ),
    dividerTheme: DividerThemeData(
      color: colors.outlineVariant,
      space: 1,
      thickness: 1,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: colors.surfaceContainer,
      side: BorderSide(color: colors.outlineVariant),
      labelStyle: text.labelMedium?.copyWith(color: colors.onSurface),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        textStyle: text.labelLarge,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        ),
      ),
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: colors.surfaceContainerLow,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        side: BorderSide(color: colors.outlineVariant),
      ),
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: colors.inverseSurface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      textStyle: text.bodySmall?.copyWith(color: colors.onInverseSurface),
    ),
  );
}
