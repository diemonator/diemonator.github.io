import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/language_extensions.dart';
import '../../../core/extensions/media_query_extensions.dart';
import '../../../core/themes/app_spacing.dart';
import '../../../core/widgets/section_heading.dart';
import 'bloc/portfolio_bloc.dart';
import 'bloc/portfolio_state.dart';
import 'widgets/portfolio_category_card.dart';

class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    final grid = context.gridChildCountAndRatio;
    final lang = context.appLocalizations;

    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, state) {
        return AnimationLimiter(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: context.contentPadding.copyWith(
                  top: AppSpacing.xl,
                  bottom: AppSpacing.lg,
                ),
                sliver: SliverToBoxAdapter(
                  child: SectionHeading(
                    eyebrow: lang.portfolio,
                    title: lang.techStack,
                  ),
                ),
              ),
              SliverPadding(
                padding: context.contentPadding.copyWith(
                  bottom: AppSpacing.xxl,
                ),
                sliver: SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: grid.columnCount,
                    childAspectRatio: grid.ratio,
                    crossAxisSpacing: AppSpacing.md,
                    mainAxisSpacing: AppSpacing.md,
                  ),
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    final category = state.categories[index];

                    return AnimationConfiguration.staggeredGrid(
                      columnCount: grid.columnCount,
                      position: index,
                      child: FadeInAnimation(
                        child: ScaleAnimation(
                          child: PortfolioCategoryCard(
                            category: category.route,
                            projectCount: category.projectCount,
                            onTap: () => context.goNamed(category.route.name),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
