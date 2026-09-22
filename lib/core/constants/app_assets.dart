sealed class AppAssets {
  // images
  static const String cover = 'assets/images/cover.webp';
  static const String embeddedFitness = 'assets/images/embedded_fitness.webp';
  static const String kaizenGaming = 'assets/images/kaizen_gaming.webp';
  static const String vanderlande = 'assets/images/vanderlande.webp';
  static const String appolica = 'assets/images/appolica.webp';
  static const String authore = 'assets/images/author-e.webp';
  static const String fontys = 'assets/images/fontys.webp';
  static const String me = 'assets/images/me.webp';

  // svgs
  static const String signature = 'assets/svgs/signature.svg';
  static const String homeCover = 'assets/svgs/hero-devices.svg';
  static const String js = 'assets/svgs/js.svg';
  static const String ts = 'assets/svgs/typescript.svg';
  static const String kotlin = 'assets/svgs/kotlin.svg';
  static const String java = 'assets/svgs/java.svg';
  static const String cSharp = 'assets/svgs/c-sharp.svg';
  static const String flutter = 'assets/svgs/flutter.svg';
  static const String dart = 'assets/svgs/dart.svg';
  static const String swift = 'assets/svgs/swift.svg';
  static const String android = 'assets/svgs/android.svg';
  static const String ios = 'assets/svgs/ios.svg';
  static const String asp = 'assets/svgs/asp.svg';
  static const String node = 'assets/svgs/node.svg';
  static const String linkedin = 'assets/svgs/linkedin.svg';
  static const String gmail = 'assets/svgs/gmail.svg';
  static const String github = 'assets/svgs/github.svg';
  static const String budget = 'assets/svgs/budget.svg';
  static const String flutterPackage = 'assets/svgs/flutter-package.svg';
  static const String imgur = 'assets/svgs/imgur.svg';
  static const String layers = 'assets/svgs/layers.svg';
  static const String modularplug = 'assets/svgs/modularplug.svg';
  static const String portfolio = 'assets/svgs/portfolio.svg';
  static const String youtube = 'assets/svgs/youtube.svg';
  static const String stretching = 'assets/svgs/stretching.svg';
  static const String db = 'assets/svgs/db.svg';
  static const String dbDoc = 'assets/svgs/mongodb-doc.svg';
  static const String sql = 'assets/svgs/sql.svg';

  /// Raster assets, warmed through Flutter's [ImageCache].
  static const List<String> images = [
    cover,
    embeddedFitness,
    kaizenGaming,
    vanderlande,
    appolica,
    authore,
    fontys,
    me,
  ];

  /// Vector assets, warmed through flutter_svg's own cache. Kept separate
  /// because the two caches are unrelated and warmed differently.
  static const List<String> svgs = [
    signature,
    homeCover,
    js,
    ts,
    kotlin,
    java,
    cSharp,
    flutter,
    dart,
    swift,
    android,
    ios,
    asp,
    node,
    linkedin,
    gmail,
    github,
    budget,
    flutterPackage,
    imgur,
    layers,
    modularplug,
    portfolio,
    youtube,
    stretching,
    db,
    dbDoc,
    sql,
  ];
}
