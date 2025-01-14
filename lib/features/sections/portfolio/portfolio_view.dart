import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/navigation/app_routes.dart';

class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    final columCount = MediaQuery.sizeOf(context).width > 800 ? 2 : 1;

    return AnimationLimiter(
      child: GridView.count(
        crossAxisCount: columCount,
        childAspectRatio: 2,
        children: List.generate(
          AppRoutes.portfolio.children.length,
          (index) {
            final item = AppRoutes.portfolio.children[index];

            return AnimationConfiguration.staggeredGrid(
              columnCount: columCount,
              position: index,
              child: FadeInAnimation(
                child: ScaleAnimation(
                  child: _FrameworkBadge(
                    item.name,
                    item.assetPath,
                    item.title,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _FrameworkBadge extends StatelessWidget {
  const _FrameworkBadge(
    this.name,
    this.imagePath,
    this.label,
  );

  final String name;
  final String imagePath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.goNamed(name),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor,
            ),
            child: SvgPicture.asset(imagePath, width: 100, height: 100),
          ),
          const Gap(16),
          SelectableText(label),
        ],
      ),
    );
  }
}
