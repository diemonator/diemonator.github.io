import '../models/timeline_entry.dart';
import '../repositories/profile_repository.dart';
import 'profile_service.dart';

class ProfileServiceImpl implements ProfileService {
  const ProfileServiceImpl(this._repository);

  final ProfileRepository _repository;

  @override
  List<TimelineEntry> entriesOf(TimelineKind kind) => _repository.timeline
      .where((entry) => entry.kind == kind)
      .toList(growable: false);
}
