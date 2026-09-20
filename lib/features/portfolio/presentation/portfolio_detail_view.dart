import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../core/extensions/language_extensions.dart';
import '../../../core/extensions/media_query_extensions.dart';
import '../../../core/themes/app_spacing.dart';
import '../../../core/widgets/section_heading.dart';
import 'bloc/portfolio_detail_bloc.dart';
import 'bloc/portfolio_detail_event.dart';
import 'bloc/portfolio_detail_state.dart';
import 'widgets/portfolio_project_card.dart';

class PortfolioDetailView extends StatefulWidget {
  const PortfolioDetailView({super.key});

  @override
  State<PortfolioDetailView> createState() => _PortfolioDetailViewState();
}

class _PortfolioDetailViewState extends State<PortfolioDetailView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Read here rather than in the bloc: the route name is router state, and
    // it changes when the user navigates between sibling categories.
    context.read<PortfolioDetailBloc>().add(
      PortfolioDetailLoadEvent(GoRouterState.of(context).name),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobileScreen;

    return BlocBuilder<PortfolioDetailBloc, PortfolioDetailState>(
      builder: (context, state) {
        return Scaffold(
          appBar: isMobile ? AppBar(title: Text(state.title)) : null,
          body: state.isEmpty
              ? Center(child: Text(context.appLocalizations.underConstruction))
              : AnimationLimiter(
                  child: ListView.separated(
                    padding: context.contentPadding.copyWith(
                      top: AppSpacing.xl,
                      bottom: AppSpacing.xxl,
                    ),
                    // The heading rides in the list so it scrolls away with
                    // the content instead of pinning a mostly-empty bar.
                    itemCount: state.projects.length + 1,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: AppSpacing.lg),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: AppSpacing.md),
                          child: SectionHeading(
                            eyebrow: context.appLocalizations.portfolio,
                            title: state.title,
                          ),
                        );
                      }

                      final project = state.projects[index - 1];

                      return AnimationConfiguration.staggeredList(
                        position: index,
                        child: FadeInAnimation(
                          child: PortfolioProjectCard(
                            project: project,
                            onOpenSource: () =>
                                launchUrlString(project.gitHubLink!),
                          ),
                        ),
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
