import 'package:flutter/material.dart';

import '../themes/app_spacing.dart';
import '../themes/theme_extension.dart';

/// The one section header used across the app: a small tracked-out eyebrow
/// over a headline, with a short accent rule.
class SectionHeading extends StatelessWidget {
  const SectionHeading({
    required this.title,
    this.eyebrow,
    this.alignment = CrossAxisAlignment.start,
    super.key,
  });

  final String title;
  final String? eyebrow;
  final CrossAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    final eyebrow = this.eyebrow;

    return Column(
      crossAxisAlignment: alignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (eyebrow != null) ...[
          Text(
            eyebrow.toUpperCase(),
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colors.primary,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
        ],
        SelectableText(title, style: context.textTheme.headlineMedium),
        const SizedBox(height: AppSpacing.sm),
        Container(
          width: 48,
          height: 3,
          decoration: BoxDecoration(
            color: context.colors.primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
