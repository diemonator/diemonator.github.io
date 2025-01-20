import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/url_links.dart';
import '../../../core/extensions/media_query_extensions.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isScreenMedium;
    final primaryColor = Theme.of(context).colorScheme.onSurface;

    final title = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '  Want to \n get in \ntouch?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: isMobile ? 56 : 84),
          ),
          Text(
            'Or just say hello.',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: isMobile ? 16 : 24),
          ),
        ],
      ),
    );

    final form = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: primaryColor)),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.location_pin),
                  Gap(24),
                  SelectableText(
                    'Sofia, Bulgaria',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Gap(24),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.phone),
                  Gap(24),
                  SelectableText(
                    '089 960 69 01',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Gap(24),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.email),
                  Gap(24),
                  SelectableText(
                    'emilkaramihov@gmail.com\ne.k.karamihov@gmail.com',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Gap(32),
            ],
          ),
        ),
        const Gap(24),
        Wrap(
          spacing: 16.0,
          runSpacing: 8.0,
          children: [
            InkWell(
              onTap: () => launchUrlString(UrlLinks.linkedIn),
              child: SvgPicture.asset(
                AppAssets.linkedin,
                colorFilter: ColorFilter.mode(
                  primaryColor,
                  BlendMode.srcIn,
                ),
                height: 24,
                width: 24,
              ),
            ),
            InkWell(
              onTap: () => launchUrlString(UrlLinks.github),
              child: SvgPicture.asset(
                AppAssets.github,
                colorFilter: ColorFilter.mode(
                  primaryColor,
                  BlendMode.srcIn,
                ),
                height: 24,
                width: 24,
              ),
            ),
          ],
        ),
        const Gap(16),
        const SelectableText('Follow me on social media'),
      ],
    );

    return isMobile
        ? ListView(children: [title, const Gap(32), form, const Gap(16)])
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(child: title),
                Expanded(child: Center(child: form)),
              ],
            ),
          );
  }
}
