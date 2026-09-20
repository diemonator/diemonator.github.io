import 'package:flutter/material.dart';

import '../extensions/media_query_extensions.dart';

/// Applies the responsive side gutters once, so a section's children do not
/// each repeat the padding. Full-bleed children belong outside it.
class ContentColumn extends StatelessWidget {
  const ContentColumn({
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    super.key,
  });

  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.contentPadding,
      child: Column(crossAxisAlignment: crossAxisAlignment, children: children),
    );
  }
}
