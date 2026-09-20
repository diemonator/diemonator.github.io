import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/extensions/language_extensions.dart';
import '../../../core/extensions/media_query_extensions.dart';
import '../../../core/themes/app_spacing.dart';
import '../../../core/themes/theme_extension.dart';
import '../../../core/widgets/animation_frame_fade.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_state.dart';
import 'widgets/home_hero.dart';
import 'widgets/technology_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.appLocalizations;
    final isDesktop = context.isDesktopScreen;

    return AnimationFrameFade(
      child: ListView(
        children: [
          const HomeHero(),
          const _AccentBand(),
          Padding(
            padding: context.contentPadding.copyWith(
              top: AppSpacing.xxl,
              bottom: AppSpacing.xxl,
            ),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                final stack = Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.lg),
                        child: SelectableText(
                          lang.smallIntro,
                          style: context.textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    TechnologyCard(
                      title: lang.techStack,
                      technologies: state.technologies,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    TechnologyCard(
                      title: lang.programmingLanguageStack,
                      technologies: state.programmingLanguages,
                    ),
                  ],
                );

                if (!isDesktop) {
                  return stack;
                }

                return Row(
                  crossAxisAlignment: .start,
                  children: [
                    Expanded(child: stack),
                    const SizedBox(width: AppSpacing.xl),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusLg,
                        ),
                        child: const Image(
                          image: AssetImage(AppAssets.cover),
                          fit: .cover,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Full-bleed on purpose: it sits outside [contentPadding] so the band spans
/// the window while the text above and below stays in the reading column.
class _AccentBand extends StatelessWidget {
  const _AccentBand();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colors.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
        child: Center(
          child: SvgPicture.asset(
            AppAssets.homeCover,
            width: context.contentWidth / 2,
          ),
        ),
      ),
    );
  }
}
