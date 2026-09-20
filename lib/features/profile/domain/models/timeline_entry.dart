import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/localization/generated/app_localizations.dart';

/// Pulls one string out of the generated localizations. Lets the data layer
/// name the copy it wants without holding a [BuildContext].
typedef LocalizedText = String Function(AppLocalizations lang);

enum TimelineKind { work, education }

final class TimelineEntry extends Equatable {
  const TimelineEntry({
    required this.organisation,
    required this.kind,
    required this.time,
    required this.position,
    this.location,
    this.tasks = const [],
    this.icon = Icons.location_pin,
  });

  /// Company and school names are proper nouns, so they are not localized.
  final String organisation;
  final TimelineKind kind;
  final LocalizedText time;

  /// Absent for roles with no fixed place of work, such as freelance.
  final LocalizedText? location;
  final LocalizedText position;
  final List<LocalizedText> tasks;
  final IconData icon;

  @override
  List<Object?> get props => [organisation, kind, icon];
}
