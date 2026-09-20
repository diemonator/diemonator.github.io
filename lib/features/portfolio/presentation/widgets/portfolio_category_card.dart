import 'package:flutter/material.dart';

import '../../../../core/navigation/app_routes.dart';
import '../../../../core/themes/app_spacing.dart';
import '../../../../core/themes/theme_extension.dart';

class PortfolioCategoryCard extends StatelessWidget {
  const PortfolioCategoryCard({
    required this.category,
    required this.projectCount,
    required this.onTap,
    super.key,
  });

  final AppRoutes category;
  final int projectCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Card(
      clipBehavior: .antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: colors.primaryContainer,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                ),
                child: Icon(
                  category.iconData,
                  size: 28,
                  color: colors.onPrimaryContainer,
                ),
              ),
              const Spacer(),
              Text(category.title, style: context.textTheme.titleLarge),
              const SizedBox(height: AppSpacing.xxs),
              Row(
                children: [
                  Text(
                    projectCount > 0 ? '$projectCount' : '—',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.arrow_forward, size: 18, color: colors.primary),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
