import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/core/widgets/bullet_text.dart';
import 'package:portfolio/features/portfolio/data/datasources/portfolio_local_data_source.dart';
import 'package:portfolio/features/portfolio/presentation/widgets/project_description.dart';

Future<void> _pump(WidgetTester tester, String description) {
  return tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(child: ProjectDescription(description)),
      ),
    ),
  );
}

void main() {
  testWidgets('promotes marker lines to themed bullets', (tester) async {
    await _pump(tester, 'Intro line\n\n🔹 First\n🔹 Second\n\nOutro');

    expect(find.byType(BulletText), findsNWidgets(2));
    // The emoji is replaced by the drawn dot, not kept alongside it.
    expect(find.textContaining('🔹'), findsNothing);
    expect(find.text('First'), findsOneWidget);
  });

  // databases_content.dart indents its whole description inside the triple
  // quoted string, so every line arrives with leading whitespace.
  testWidgets('handles indented markers and trims stray whitespace', (
    tester,
  ) async {
    await _pump(tester, '      Intro  \n\n      🔹 Indented bullet  \n');

    expect(find.byType(BulletText), findsOneWidget);
    expect(find.text('Indented bullet'), findsOneWidget);
    expect(find.text('Intro'), findsOneWidget);
  });

  testWidgets('drops blank lines instead of rendering empty paragraphs', (
    tester,
  ) async {
    await _pump(tester, 'One\n\n\n\nTwo');

    expect(find.byType(SelectableText), findsNWidgets(2));
  });

  // The real content is the thing that has to render; a marker style the
  // parser misses would silently leave a raw emoji on the page.
  testWidgets('no raw marker survives in any shipped description', (
    tester,
  ) async {
    const dataSource = PortfolioLocalDataSource();
    var bullets = 0;

    for (final category in dataSource.getCategories()) {
      for (final project in dataSource.getProjects(category)) {
        await _pump(tester, project.description);

        expect(
          find.textContaining('🔹'),
          findsNothing,
          reason: 'raw marker left in "${project.title}"',
        );
        bullets += tester.widgetList(find.byType(BulletText)).length;
      }
    }

    expect(bullets, greaterThan(100), reason: 'bullets should be parsed');
  });
}
