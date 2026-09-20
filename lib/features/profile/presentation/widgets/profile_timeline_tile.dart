import 'package:flutter/material.dart';

import '../../../../core/extensions/language_extensions.dart';
import '../../../../core/themes/app_spacing.dart';
import '../../../../core/themes/theme_extension.dart';
import '../../../../core/widgets/bullet_text.dart';
import '../../domain/models/timeline_entry.dart';

/// One CV row: a rail with a node on the left, the entry's copy on the right.
class ProfileTimelineTile extends StatelessWidget {
  const ProfileTimelineTile({
    required this.entry,
    required this.isLast,
    super.key,
  });

  final TimelineEntry entry;

  /// The last tile stops the connecting rail instead of running it off the
  /// bottom of the section.
  final bool isLast;

  static const double _nodeSize = 36;
  static const double _railGap = AppSpacing.lg;

  @override
  Widget build(BuildContext context) {
    final lang = context.appLocalizations;
    final colors = context.colors;
    final text = context.textTheme;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: .stretch,
        children: [
          SizedBox(
            width: _nodeSize,
            child: Column(
              children: [
                Container(
                  width: _nodeSize,
                  height: _nodeSize,
                  decoration: BoxDecoration(
                    shape: .circle,
                    color: colors.primaryContainer,
                    border: Border.all(color: colors.outlineVariant),
                  ),
                  child: Icon(
                    entry.icon,
                    size: 18,
                    color: colors.onPrimaryContainer,
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(width: 2, color: colors.outlineVariant),
                  ),
              ],
            ),
          ),
          const SizedBox(width: _railGap),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : AppSpacing.xl),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  SelectableText(entry.organisation, style: text.titleLarge),
                  const SizedBox(height: AppSpacing.xxs),
                  SelectableText(
                    entry.position(lang),
                    style: text.titleSmall?.copyWith(color: colors.primary),
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  SelectableText(
                    [entry.time(lang), ?entry.location?.call(lang)].join(' · '),
                    style: text.bodySmall?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                  if (entry.tasks.isNotEmpty) ...[
                    const SizedBox(height: AppSpacing.md),
                    ...entry.tasks.map((task) => BulletText(task(lang))),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
