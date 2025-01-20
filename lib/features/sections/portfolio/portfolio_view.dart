import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/media_query_extensions.dart';
import '../../../core/navigation/app_routes.dart';

class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    final columCount = !context.isScreenMedium ? 2 : 1;

    return AnimationLimiter(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columCount,
          childAspectRatio: 2,
        ),
        itemCount: AppRoutes.portfolio.children.length,
        itemBuilder: (context, index) {
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
    );
  }
}

class _FrameworkBadge extends StatelessWidget {
  const _FrameworkBadge(this._name, this._imagePath, this._label);

  final String _name;
  final String _imagePath;
  final String _label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.goNamed(_name),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).focusColor,
            ),
            child: SvgPicture.asset(_imagePath, width: 100, height: 100),
          ),
          const Gap(16),
          SelectableText(_label),
        ],
      ),
    );
  }
}
