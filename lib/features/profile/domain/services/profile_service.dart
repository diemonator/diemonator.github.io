import '../models/timeline_entry.dart';

abstract interface class ProfileService {
  /// The CV split the way the page renders it: work history, then education.
  List<TimelineEntry> entriesOf(TimelineKind kind);
}
