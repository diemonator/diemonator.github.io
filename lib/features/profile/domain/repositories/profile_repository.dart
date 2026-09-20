import '../models/timeline_entry.dart';

abstract interface class ProfileRepository {
  List<TimelineEntry> get timeline;
}
