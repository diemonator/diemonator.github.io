import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../core/extensions/language_extensions.dart';
import '../../../core/extensions/media_query_extensions.dart';
import '../home/widgets/animation_frame_fade.dart';
import 'view_content/contact_info_content.dart';
import 'view_content/social_media_info_content.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    final isTabletSizedScreen = context.isTabletSizedScreen;
    final primaryColor = Theme.of(context).colorScheme.onSurface;
    final lang = context.appLocalizations;

    final title = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          SelectableText(
            lang.getInTouch,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: isTabletSizedScreen ? 56 : 84),
          ),
          SelectableText(
            lang.sayHello,
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: isTabletSizedScreen ? 16 : 24),
          ),
        ],
      ),
    );

    final contactInfos = ContactInfoContent.of(context)
        .map(
          (e) => Column(
            children: [
              GestureDetector(
                onTap: e.onTap,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(e.icon),
                    const Gap(24),
                    SelectableText(
                      e.text,
                      style: const TextStyle(fontSize: 16),
                      onTap: e.onTap,
                    ),
                  ],
                ),
              ),
              const Gap(24),
            ],
          ),
        )
        .toList();

    final mediaInfos = socialMediaInfoContent
        .map(
          (e) => InkWell(
            onTap: e.onTap,
            child: SvgPicture.asset(
              e.svgPath,
              colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
              height: 24,
              width: 24,
            ),
          ),
        )
        .toList();

    final body = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: primaryColor)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: contactInfos,
          ),
        ),
        const Gap(32),
        Wrap(
          spacing: 16.0,
          runSpacing: 8.0,
          children: mediaInfos,
        ),
        const Gap(16),
        SelectableText(lang.follow),
      ],
    );

    return AnimationFrameFade(
      child: isTabletSizedScreen
          ? Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [title, const Gap(32), body, const Gap(16)],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(child: title),
                  Expanded(child: Center(child: body)),
                ],
              ),
            ),
    );
  }
}
