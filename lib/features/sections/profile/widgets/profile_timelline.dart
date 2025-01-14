import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/extensions/media_query_extensions.dart';

class ProfileTimeline extends StatelessWidget {
  const ProfileTimeline({
    required this.title,
    required this.time,
    required this.location,
    required this.position,
    this.texts = const [],
    this.icon = Icons.location_pin,
    this.isFirst = false,
    this.isLast = false,
    super.key,
  });

  final String title;
  final String location;
  final String time;
  final String position;
  final IconData icon;
  final List<String> texts;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final strBuilder = StringBuffer();
    for (final item in texts) {
      strBuilder.writeln('- $item');
    }
    final description = strBuilder.toString();

    return Stack(
      children: [
        const Positioned(
          width: 3,
          top: 0,
          left: 14.5,
          bottom: 0,
          child: ColoredBox(color: Colors.blue),
        ),
        Positioned(
          top: isFirst ? 0 : null,
          bottom: isLast ? 0 : null,
          child: CircleAvatar(
            radius: 16,
            backgroundColor: Colors.blue,
            child: Icon(icon, color: Colors.white, size: 20),
          ),
        ),
        Row(
          children: [
            const Gap(48.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SelectableText(
                    location,
                    style: const TextStyle(fontSize: 16),
                  ),
                  SelectableText(
                    time,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const Gap(8),
                  SelectableText(
                    position,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Gap(16),
                  if (texts.isNotEmpty) ...[
                    SelectableText(
                      description,
                      style: TextStyle(fontSize: context.textScale(16)),
                    ),
                    const Gap(16),
                  ],
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
