import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../models/technology.dart';

class TechnologyCard extends StatelessWidget {
  const TechnologyCard({
    required this.title,
    required this.children,
    super.key,
  });

  final String title;
  final List<Technology> children;

  @override
  Widget build(BuildContext context) {
    final children = this.children;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SelectableText(title),
            const Gap(8),
            Wrap(
              alignment: .center,
              runSpacing: 8,
              spacing: 8,
              children: children
                  .map(
                    (e) => Chip(
                      label: SelectableText(e.title),
                      avatar: SvgPicture.asset(e.svgPath),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
