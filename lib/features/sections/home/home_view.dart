import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/extensions/language_extensions.dart';
import '../../../core/extensions/media_query_extensions.dart';
import 'view_content/home_content.dart';
import 'widgets/animation_frame_fade.dart';
import 'widgets/introduction_card.dart';
import 'widgets/technology_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktopScreen = context.isDesktopScreen;
    final imageHeight = size.height / 2;
    final imageWidth = size.width / 2;
    final lang = context.appLocalizations;

    return AnimationFrameFade(
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: .center,
            children: [
              const Gap(24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 42.0),
                child: Column(
                  children: [
                    SelectableText(
                      lang.personalStatement,
                      style: TextStyle(
                        fontSize: context.textScale(32),
                        fontWeight: .bold,
                      ),
                      textAlign: .center,
                    ),
                    const Gap(16),
                    SelectableText(
                      lang.codingPhilosophy,
                      style: TextStyle(fontSize: context.textScale(16)),
                      textAlign: .center,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(AppAssets.me),
                  radius: 80,
                ),
              ),
              Container(
                width: double.maxFinite,
                color: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: SvgPicture.asset(AppAssets.homeCover, width: imageWidth),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: .center,
                    children: [
                      const IntroductionCard(),
                      TechnologyCard(
                        title: lang.techStack,
                        children: technologiesContent,
                      ),
                      TechnologyCard(
                        title: lang.programmingLanguageStack,
                        children: programmingLanguagesContent,
                      ),
                    ],
                  ),
                ),
                if (isDesktopScreen)
                  Expanded(
                    child: Image(
                      image: const AssetImage(AppAssets.cover),
                      width: imageWidth,
                      height: imageHeight,
                      fit: .contain,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
