import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gap/gap.dart';

import '../view_content/view_content.dart';
import 'portfolio_list_view_item.dart';

class PortfolioListView extends StatelessWidget {
  const PortfolioListView({
    required this.width,
    required this.isTabletSizedScreen,
    required this.data,
    super.key,
  });

  final double width;
  final bool isTabletSizedScreen;
  final List<ViewContent> data;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: width),
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          final edgeInsertSize = isTabletSizedScreen ? 16.0 : 64.0;
          final shouldShowOnLeft = index.isEven && !isTabletSizedScreen;
          final shouldShowOnRight = index.isOdd && !isTabletSizedScreen;

          return AnimationConfiguration.staggeredList(
            position: index,
            child: FadeInAnimation(
              child: ScaleAnimation(
                child: PortfolioListViewItem(
                  item: item,
                  edgeInsertSize: edgeInsertSize,
                  shouldShowOnLeft: shouldShowOnLeft,
                  shouldShowOnRight: shouldShowOnRight,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const Gap(32),
      ),
    );
  }
}
