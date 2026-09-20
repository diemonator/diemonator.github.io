import 'package:equatable/equatable.dart';

import '../../domain/models/timeline_entry.dart';

class ProfileState extends Equatable {
  const ProfileState({this.work = const [], this.education = const []});

  final List<TimelineEntry> work;
  final List<TimelineEntry> education;

  @override
  List<Object> get props => [work, education];
}
