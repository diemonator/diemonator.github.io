import 'package:flutter/material.dart';

import '../../../../core/extensions/language_extensions.dart';

class IntroductionCard extends StatelessWidget {
  const IntroductionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.appLocalizations;

    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SelectableText(lang.smallIntro),
      ),
    );
  }
}
