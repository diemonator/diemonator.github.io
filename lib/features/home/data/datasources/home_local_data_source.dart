import '../../../../core/constants/app_assets.dart';
import '../../domain/models/technology.dart';

/// Compiled-in content. ponytail: concrete, no interface — there is one source
/// and no remote variant; give it an interface when the content moves to a CMS.
class HomeLocalDataSource {
  const HomeLocalDataSource();

  List<Technology> getTechnologies() => const [
    Technology('Flutter', AppAssets.flutter),
    Technology('Android', AppAssets.android),
    Technology('iOS', AppAssets.ios),
    Technology('ASP.NET', AppAssets.asp),
    Technology('NodeJS', AppAssets.node),
  ];

  List<Technology> getProgrammingLanguages() => const [
    Technology('Dart', AppAssets.dart),
    Technology('Kotlin', AppAssets.kotlin),
    Technology('Java', AppAssets.java),
    Technology('Swift', AppAssets.swift),
    Technology('C#', AppAssets.cSharp),
    Technology('JS', AppAssets.js),
    Technology('TS', AppAssets.ts),
  ];
}
