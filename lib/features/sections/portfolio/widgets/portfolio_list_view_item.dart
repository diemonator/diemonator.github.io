import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../view_content/view_content.dart';

class PortfolioListViewItem extends StatelessWidget {
  const PortfolioListViewItem({
    required this.item,
    required this.edgeInsertSize,
    required this.shouldShowOnLeft,
    required this.shouldShowOnRight,
    super.key,
  });

  final ViewContent item;
  final double edgeInsertSize;
  final bool shouldShowOnLeft;
  final bool shouldShowOnRight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(edgeInsertSize),
                child: Column(
                  children: [
                    SelectableText(
                      item.title,
                      style: const TextStyle(fontSize: 24, fontWeight: .bold),
                    ),
                    const Gap(24),
                    Row(
                      children: [
                        if (shouldShowOnLeft) ...[
                          _buildCardWidget(),
                          const Gap(64),
                        ],
                        Expanded(
                          flex: 2,
                          child: SelectableText(item.description),
                        ),
                        if (shouldShowOnRight) ...[
                          const Gap(64),
                          _buildCardWidget(),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: .circle,
              color: Colors.deepPurpleAccent,
            ),
            child: SvgPicture.asset(
              item.svgLanguage,
              height: 32,
              width: 32,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardWidget() {
    return Expanded(
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SvgPicture.asset(
            item.svgImage,
            height: 300,
            width: 300,
          ),
        ),
      ),
    );
  }
}
