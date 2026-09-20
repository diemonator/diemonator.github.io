import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/features/profile/data/datasources/profile_local_data_source.dart';
import 'package:portfolio/features/profile/domain/models/timeline_entry.dart';

Map<String, dynamic> _arb(String locale) =>
    jsonDecode(File('lib/core/localization/app_$locale.arb').readAsStringSync())
        as Map<String, dynamic>;

void main() {
  const dataSource = ProfileLocalDataSource();

  // The stored dates once said Kaizen ran "March 2023 – Present" while the
  // real current role was TOKI, so the page showed two current jobs.
  test('exactly one role is marked as current', () {
    final current = _arb('en').entries
        .where((e) => e.key.endsWith('Time'))
        .where((e) => (e.value as String).endsWith('Present'))
        .map((e) => e.key);

    expect(current, ['tokiTime']);
  });

  test('the bulgarian arb marks the same single role as current', () {
    final current = _arb('bg').entries
        .where((e) => e.key.endsWith('Time'))
        .where((e) => (e.value as String).endsWith('Настояще'))
        .map((e) => e.key);

    expect(current, ['tokiTime']);
  });

  test('work history is listed newest first, starting at TOKI', () {
    final work = dataSource
        .getTimeline()
        .where((e) => e.kind == TimelineKind.work)
        .toList();

    expect(work.first.organisation, 'TOKI');
    expect(
      work.map((e) => e.organisation),
      containsAllInOrder(['TOKI', 'Kaizen Gaming', 'Freelance', 'Appolica']),
    );
  });

  // Only the freelance role omits it; every other entry names where it was.
  test('only the freelance role has no location', () {
    final withoutLocation = dataSource
        .getTimeline()
        .where((e) => e.location == null)
        .map((e) => e.organisation);

    expect(withoutLocation, ['Freelance']);
  });
}
