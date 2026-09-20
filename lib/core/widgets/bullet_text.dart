import 'package:flutter/material.dart';

import '../themes/app_spacing.dart';
import '../themes/theme_extension.dart';

/// One bulleted line, with the marker drawn from the theme rather than baked
/// into the copy as an emoji — so it recolours with light/dark like the rest
/// of the page.
class BulletText extends StatelessWidget {
  const BulletText(this.text, {this.style, super.key});

  final String text;
  final TextStyle? style;

  static const double _dotSize = 5;

  @override
  Widget build(BuildContext context) {
    final style =
        this.style ??
        context.textTheme.bodyMedium?.copyWith(
          color: context.colors.onSurfaceVariant,
        );

    // Centre the dot on the first line rather than nudging it by a constant:
    // the two call sites use different text sizes.
    final lineHeight = (style?.fontSize ?? 14) * (style?.height ?? 1.4);

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: (lineHeight - _dotSize) / 2),
            child: Container(
              width: _dotSize,
              height: _dotSize,
              decoration: BoxDecoration(
                shape: .circle,
                color: context.colors.primary,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(child: SelectableText(text, style: style)),
        ],
      ),
    );
  }
}
