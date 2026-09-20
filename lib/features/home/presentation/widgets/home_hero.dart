import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/extensions/language_extensions.dart';
import '../../../../core/extensions/media_query_extensions.dart';
import '../../../../core/themes/app_spacing.dart';
import '../../../../core/themes/theme_extension.dart';

class HomeHero extends StatelessWidget {
  const HomeHero({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.appLocalizations;
    final isMobile = context.isMobileScreen;

    return Padding(
      padding: context.contentPadding.copyWith(
        top: isMobile ? AppSpacing.xl : AppSpacing.xxxl,
        bottom: isMobile ? AppSpacing.xl : AppSpacing.xxl,
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: .circle,
              border: Border.all(color: context.colors.primary, width: 3),
            ),
            padding: const EdgeInsets.all(AppSpacing.xxs),
            child: CircleAvatar(
              backgroundImage: const AssetImage(AppAssets.me),
              radius: isMobile ? 56 : 72,
              backgroundColor: context.colors.surfaceContainer,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          SelectableText(
            lang.personalStatement,
            style: context.textTheme.displaySmall,
            textAlign: .center,
          ),
          const SizedBox(height: AppSpacing.md),
          ConstrainedBox(
            // Independent of the page gutters: a pull-quote reads best a good
            // bit narrower than the body column it sits in.
            constraints: const BoxConstraints(maxWidth: 680),
            child: SelectableText(
              lang.codingPhilosophy,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
              textAlign: .center,
            ),
          ),
        ],
      ),
    );
  }
}
