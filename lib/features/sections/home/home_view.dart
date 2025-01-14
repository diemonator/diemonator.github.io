import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_assets.dart';
import 'widgets/pop_down_card.dart';
import 'widgets/pop_up_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width > 800;
    final imageHeight = size.height / 2;
    final imageWidth = size.width / 2;

    return ListView(
      children: [
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 42.0),
              child: Column(
                children: [
                  SelectableText(
                    "I'm a software engineer driven by a passion for development and continuous learning.",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Gap(16),
                  SelectableText(
                    'I enjoy crafting clean, efficient code, blending passion with creativity and fun.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(AppAssets.me),
                radius: 80,
              ),
            ),
          ],
        ),
        Container(
          color: Colors.deepPurple,
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: SvgPicture.asset(AppAssets.homeCover, width: imageWidth),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const PopDownCard(),
                    PopUpCard(
                      title: 'My technology stack',
                      children: [
                        Chip(
                          avatar: SvgPicture.asset(AppAssets.flutter),
                          label: const SelectableText('Flutter'),
                        ),
                        const Chip(
                          avatar: Icon(Icons.android, color: Colors.green),
                          label: SelectableText('Android'),
                        ),
                        const Chip(
                          avatar: Icon(Icons.apple, color: Colors.black),
                          label: SelectableText('iOS'),
                        ),
                        Chip(
                          avatar: SvgPicture.asset(AppAssets.asp),
                          label: const SelectableText('ASP.NET Core'),
                        ),
                        Chip(
                          avatar: SvgPicture.asset(AppAssets.node),
                          label: const SelectableText('NodeJS'),
                        ),
                      ],
                    ),
                    PopUpCard(
                      title: 'My programming language stack',
                      children: [
                        Chip(
                          avatar: SvgPicture.asset(AppAssets.dart),
                          label: const SelectableText('Dart'),
                        ),
                        Chip(
                          avatar: SvgPicture.asset(AppAssets.kotlin),
                          label: const SelectableText('Kotlin'),
                        ),
                        Chip(
                          avatar: SvgPicture.asset(AppAssets.java),
                          label: const SelectableText('Java'),
                        ),
                        Chip(
                          avatar: SvgPicture.asset(AppAssets.swift),
                          label: const SelectableText('Swift'),
                        ),
                        Chip(
                          avatar: SvgPicture.asset(AppAssets.cSharp),
                          label: const SelectableText('C#'),
                        ),
                        Chip(
                          avatar: SvgPicture.asset(AppAssets.js),
                          label: const SelectableText('JS'),
                        ),
                        Chip(
                          avatar: SvgPicture.asset(AppAssets.ts),
                          label: const SelectableText('TS'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (isMobile)
                Expanded(
                  child: Image(
                    image: const AssetImage(AppAssets.cover),
                    width: imageWidth,
                    height: imageHeight,
                    fit: BoxFit.contain,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
