import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/extensions/language_extensions.dart';
import '../../../core/extensions/media_query_extensions.dart';
import '../home/widgets/animation_frame_fade.dart';
import 'widgets/profile_timelline.dart';
import 'widgets/profile_title.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.appLocalizations;

    return AnimationFrameFade(
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ProfileTitle(lang.personalProfile),
          const Gap(16),
          SelectableText(
            lang.personalDescription,
            style: TextStyle(fontSize: context.textScale(16)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ProfileTitle(lang.workExperience),
          ),
          ProfileTimeline(
            title: 'Kaizen Gaming',
            location: lang.address,
            time: lang.kaizenTime,
            position: lang.kaizenPosition,
            texts: [
              lang.kaizenTask1,
              lang.kaizenTask2,
              lang.kaizenTask3,
              lang.kaizenTask4,
              lang.kaizenTask5,
              lang.kaizenTask6,
              lang.kaizenTask7,
              lang.kaizenTask8,
            ],
            isFirst: true,
          ),
          ProfileTimeline(
            title: 'Appolica',
            location: lang.address,
            time: lang.appolicaTime,
            position: lang.appolicaPosition,
            texts: [
              lang.appolicaTask1,
              lang.appolicaTask2,
              lang.appolicaTask3,
              lang.appolicaTask4,
              lang.appolicaTask5,
            ],
          ),
          ProfileTimeline(
            title: 'Embedded Fitness B.V.',
            location: lang.addressHelmond,
            time: lang.embeddedFitnessTime,
            position: lang.embeddedFitnessPosition,
            texts: [
              lang.embeddedFitnessTask1,
              lang.embeddedFitnessTask2,
              lang.embeddedFitnessTask3,
            ],
          ),
          ProfileTimeline(
            title: 'Vanderlande B.V.',
            location: lang.addressVeghel,
            time: lang.vanderlandeTime,
            position: lang.vanderlandePosition,
            texts: [
              lang.vanderlandeTasks1,
              lang.vanderlandeTasks2,
            ],
          ),
          ProfileTimeline(
            title: 'Author-e B.V.',
            location: lang.addressEindhoven,
            time: lang.authoreTime,
            position: lang.authorePosition,
            texts: [
              lang.authoreTasks1,
              lang.authoreTasks2,
              lang.authoreTasks3,
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ProfileTitle(lang.education),
          ),
          ProfileTimeline(
            title: lang.fontysUniversity,
            location: lang.addressEindhoven,
            time: lang.fontysTime,
            position: lang.fontysPosition,
            texts: [
              lang.fontysDetails1,
              lang.fontysDetails2,
              lang.fontysDetails3,
            ],
            icon: Icons.school,
          ),
          ProfileTimeline(
            title: lang.ntbg,
            location: lang.address,
            time: lang.ntbgTime,
            position: lang.ntbgPosition,
            icon: Icons.school_outlined,
            isLast: true,
          ),
        ],
      ),
    );
  }
}
