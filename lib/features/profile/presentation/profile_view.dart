import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/language_extensions.dart';
import '../../../core/themes/app_spacing.dart';
import '../../../core/themes/theme_extension.dart';
import '../../../core/widgets/animation_frame_fade.dart';
import '../../../core/widgets/content_column.dart';
import '../../../core/widgets/section_heading.dart';
import '../domain/models/timeline_entry.dart';
import 'bloc/profile_bloc.dart';
import 'bloc/profile_state.dart';
import 'widgets/profile_timeline_tile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.appLocalizations;

    return AnimationFrameFade(
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return ListView(
            children: [
              ContentColumn(
                children: [
                  const SizedBox(height: AppSpacing.xl),
                  SectionHeading(
                    eyebrow: lang.profile,
                    title: lang.personalProfile,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  SelectableText(
                    lang.personalDescription,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxl),
                  _Timeline(title: lang.workExperience, entries: state.work),
                  const SizedBox(height: AppSpacing.xxl),
                  _Timeline(title: lang.education, entries: state.education),
                  const SizedBox(height: AppSpacing.xxl),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Timeline extends StatelessWidget {
  const _Timeline({required this.title, required this.entries});

  final String title;
  final List<TimelineEntry> entries;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        SectionHeading(title: title),
        const SizedBox(height: AppSpacing.xl),
        ...entries.indexed.map(
          (indexed) => ProfileTimelineTile(
            entry: indexed.$2,
            isLast: indexed.$1 == entries.length - 1,
          ),
        ),
      ],
    );
  }
}
