import 'package:flutter/material.dart';

import '../../domain/models/timeline_entry.dart';

/// Compiled-in CV content. ponytail: concrete, no interface — see
/// [HomeLocalDataSource].
class ProfileLocalDataSource {
  const ProfileLocalDataSource();

  List<TimelineEntry> getTimeline() => [
    TimelineEntry(
      organisation: 'TOKI',
      kind: TimelineKind.work,
      location: (l) => l.address,
      time: (l) => l.tokiTime,
      position: (l) => l.tokiPosition,
    ),
    TimelineEntry(
      organisation: 'Kaizen Gaming',
      kind: TimelineKind.work,
      location: (l) => l.address,
      time: (l) => l.kaizenTime,
      position: (l) => l.kaizenPosition,
      tasks: [
        (l) => l.kaizenTask1,
        (l) => l.kaizenTask2,
        (l) => l.kaizenTask3,
        (l) => l.kaizenTask4,
        (l) => l.kaizenTask5,
        (l) => l.kaizenTask6,
        (l) => l.kaizenTask7,
        (l) => l.kaizenTask8,
      ],
    ),
    TimelineEntry(
      // No location: the role was freelance, with none listed.
      organisation: 'Freelance',
      kind: TimelineKind.work,
      time: (l) => l.freelanceTime,
      position: (l) => l.freelancePosition,
      tasks: [(l) => l.freelanceTask1, (l) => l.freelanceTask2],
      icon: Icons.laptop_mac,
    ),
    TimelineEntry(
      organisation: 'Appolica',
      kind: TimelineKind.work,
      location: (l) => l.address,
      time: (l) => l.appolicaTime,
      position: (l) => l.appolicaPosition,
      tasks: [
        (l) => l.appolicaTask1,
        (l) => l.appolicaTask2,
        (l) => l.appolicaTask3,
        (l) => l.appolicaTask4,
        (l) => l.appolicaTask5,
      ],
    ),
    TimelineEntry(
      organisation: 'Embedded Fitness B.V.',
      kind: TimelineKind.work,
      location: (l) => l.addressHelmond,
      time: (l) => l.embeddedFitnessTime,
      position: (l) => l.embeddedFitnessPosition,
      tasks: [
        (l) => l.embeddedFitnessTask1,
        (l) => l.embeddedFitnessTask2,
        (l) => l.embeddedFitnessTask3,
      ],
    ),
    TimelineEntry(
      organisation: 'Vanderlande B.V.',
      kind: TimelineKind.work,
      location: (l) => l.addressVeghel,
      time: (l) => l.vanderlandeTime,
      position: (l) => l.vanderlandePosition,
      tasks: [(l) => l.vanderlandeTasks1, (l) => l.vanderlandeTasks2],
    ),
    TimelineEntry(
      organisation: 'Author-e B.V.',
      kind: TimelineKind.work,
      location: (l) => l.addressEindhoven,
      time: (l) => l.authoreTime,
      position: (l) => l.authorePosition,
      tasks: [
        (l) => l.authoreTasks1,
        (l) => l.authoreTasks2,
        (l) => l.authoreTasks3,
      ],
    ),
    TimelineEntry(
      organisation: 'Fontys University',
      kind: TimelineKind.education,
      location: (l) => l.addressEindhoven,
      time: (l) => l.fontysTime,
      position: (l) => l.fontysPosition,
      tasks: [
        (l) => l.fontysDetails1,
        (l) => l.fontysDetails2,
        (l) => l.fontysDetails3,
      ],
      icon: Icons.school,
    ),
    TimelineEntry(
      organisation: 'NTBG',
      kind: TimelineKind.education,
      location: (l) => l.address,
      time: (l) => l.ntbgTime,
      position: (l) => l.ntbgPosition,
      icon: Icons.school_outlined,
    ),
  ];
}
