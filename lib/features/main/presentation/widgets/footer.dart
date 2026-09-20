import 'package:flutter/material.dart';

import '../../../../core/extensions/language_extensions.dart';
import '../../../../core/extensions/media_query_extensions.dart';
import '../../../../core/themes/app_spacing.dart';
import '../../../../core/themes/theme_extension.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      children: [
        const Divider(height: 1),
        Padding(
          padding: context.contentPadding.copyWith(
            top: AppSpacing.md,
            bottom: AppSpacing.md,
          ),
          child: SelectableText(
            context.appLocalizations.footer,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
