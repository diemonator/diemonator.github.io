import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/features/profile/data/datasources/profile_local_data_source.dart';
import 'package:portfolio/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:portfolio/features/profile/domain/models/timeline_entry.dart';
import 'package:portfolio/features/profile/domain/services/profile_service_impl.dart';

void main() {
  const service = ProfileServiceImpl(
    ProfileRepositoryImpl(ProfileLocalDataSource()),
  );

  test('splits the timeline by kind', () {
    final work = service.entriesOf(TimelineKind.work);
    final education = service.entriesOf(TimelineKind.education);

    expect(work, isNotEmpty);
    expect(education, isNotEmpty);
    expect(work.every((e) => e.kind == TimelineKind.work), isTrue);
    expect(education.every((e) => e.kind == TimelineKind.education), isTrue);
  });

  // The two lists together must be the whole CV — a kind added to the model
  // without a section on the page would silently disappear otherwise.
  test('work and education together cover every entry', () {
    const repository = ProfileRepositoryImpl(ProfileLocalDataSource());
    final split =
        service.entriesOf(TimelineKind.work).length +
        service.entriesOf(TimelineKind.education).length;

    expect(split, repository.timeline.length);
  });
}
