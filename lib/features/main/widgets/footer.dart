import 'package:flutter/material.dart';

import '../../../core/extensions/language_extensions.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(child: SelectableText(context.appLocalizations.footer)),
        ],
      ),
    );
  }
}
