import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/media_query_extensions.dart';
import '../../../core/navigation/app_routes.dart';
import 'widgets/portfolio_framework_badge.dart';

class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    final grid = context.gridChildCountAndRatio;

    return AnimationLimiter(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: grid.columnCount,
          childAspectRatio: grid.ratio,
        ),
        itemCount: AppRoutes.portfolio.children.length,
        itemBuilder: (context, index) {
          final item = AppRoutes.portfolio.children[index];

          return AnimationConfiguration.staggeredGrid(
            columnCount: grid.columnCount,
            position: index,
            child: FadeInAnimation(
              child: ScaleAnimation(
                child: PortfolioFrameworkBadge(
                  item.iconData,
                  item.title,
                  onTap: () => context.goNamed(item.name),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
