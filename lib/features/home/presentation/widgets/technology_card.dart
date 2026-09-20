import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/themes/app_spacing.dart';
import '../../../../core/themes/theme_extension.dart';
import '../../domain/models/technology.dart';

class TechnologyCard extends StatelessWidget {
  const TechnologyCard({
    required this.title,
    required this.technologies,
    super.key,
  });

  final String title;
  final List<Technology> technologies;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              title.toUpperCase(),
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              runSpacing: AppSpacing.xs,
              spacing: AppSpacing.xs,
              children: technologies
                  .map(
                    (technology) => Chip(
                      label: Text(technology.title),
                      // Excluded from semantics: the label beside it already
                      // names the technology.
                      avatar: ExcludeSemantics(
                        child: SvgPicture.asset(
                          technology.svgPath,
                          height: 18,
                          width: 18,
                        ),
                      ),
                    ),
                  )
                  .toList(growable: false),
            ),
          ],
        ),
      ),
    );
  }
}
