import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/extensions/media_query_extensions.dart';
import '../../../../core/themes/app_spacing.dart';
import '../../../../core/themes/theme_extension.dart';
import '../../domain/models/portfolio_project.dart';
import 'project_description.dart';

class PortfolioProjectCard extends StatelessWidget {
  const PortfolioProjectCard({required this.project, super.key});

  final PortfolioProject project;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    // Stacking beats side-by-side below the tablet break: the artwork would
    // otherwise squeeze the description into a column a few words wide.
    final isStacked = context.isTabletSizedScreen;

    final artwork = Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: colors.surfaceContainer,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: SvgPicture.asset(project.svgImage, height: isStacked ? 140 : 200),
    );

    final body = Column(
      crossAxisAlignment: .start,
      children: [
        SelectableText(project.title, style: context.textTheme.titleLarge),
        const SizedBox(height: AppSpacing.md),
        ProjectDescription(project.description),
      ],
    );

    return Card(
      child: Padding(
        padding: EdgeInsets.all(isStacked ? AppSpacing.lg : AppSpacing.xl),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppSpacing.xs),
                  decoration: BoxDecoration(
                    color: colors.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                  ),
                  child: SvgPicture.asset(
                    project.svgLanguage,
                    height: 22,
                    width: 22,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            if (isStacked)
              Column(
                crossAxisAlignment: .start,
                children: [
                  artwork,
                  const SizedBox(height: AppSpacing.lg),
                  body,
                ],
              )
            else
              Row(
                crossAxisAlignment: .start,
                children: [
                  Expanded(flex: 2, child: body),
                  const SizedBox(width: AppSpacing.xl),
                  Expanded(child: artwork),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
