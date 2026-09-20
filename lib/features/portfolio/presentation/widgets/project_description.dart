import 'package:flutter/material.dart';

import '../../../../core/themes/app_spacing.dart';
import '../../../../core/themes/theme_extension.dart';
import '../../../../core/widgets/bullet_text.dart';

/// Renders a project description, promoting its "🔹" lines to themed bullets.
///
/// The marker is part of the authored copy, so it is stripped here rather than
/// rewritten across every content file — that keeps the source readable as
/// prose while the rendered marker follows the theme.
class ProjectDescription extends StatelessWidget {
  const ProjectDescription(this.description, {super.key});

  final String description;

  static const String _marker = '🔹';

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme.bodyMedium?.copyWith(
      color: context.colors.onSurfaceVariant,
    );

    return Column(
      crossAxisAlignment: .start,
      children: [
        for (final block in _parse(description))
          if (block.isBullet)
            BulletText(block.text, style: style)
          else ...[
            SelectableText(block.text, style: style),
            const SizedBox(height: AppSpacing.sm),
          ],
      ],
    );
  }

  /// Blank lines only separate blocks, so they are dropped rather than turned
  /// into empty paragraphs. Every line is trimmed: some content files indent
  /// the whole block inside their triple-quoted string.
  static List<_Block> _parse(String description) {
    return [
      for (final line in description.split('\n'))
        if (line.trim().isNotEmpty)
          if (line.trim().startsWith(_marker))
            _Block(line.trim().substring(_marker.length).trim(), isBullet: true)
          else
            _Block(line.trim(), isBullet: false),
    ];
  }
}

class _Block {
  const _Block(this.text, {required this.isBullet});

  final String text;
  final bool isBullet;
}
