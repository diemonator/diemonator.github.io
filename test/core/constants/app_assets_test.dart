import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/core/constants/app_assets.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // A renamed or deleted asset is invisible until the widget using it paints,
  // and then it is a runtime exception rather than a build failure.
  test('every declared asset resolves in the bundle', () async {
    final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    final bundled = manifest.listAssets().toSet();

    final missing = [
      ...AppAssets.images,
      ...AppAssets.svgs,
    ].where((path) => !bundled.contains(path));

    expect(missing, isEmpty, reason: 'declared but not bundled');
  });

  test('images and svgs live under the right folders', () {
    expect(
      AppAssets.images.every((p) => p.startsWith('assets/images/')),
      isTrue,
    );
    expect(AppAssets.svgs.every((p) => p.endsWith('.svg')), isTrue);
  });

  // The two lists drive precaching, so a constant missing from them is an
  // asset that silently never gets warmed.
  test('every asset constant appears in exactly one list', () {
    final all = [...AppAssets.images, ...AppAssets.svgs];

    expect(all.toSet(), hasLength(all.length), reason: 'duplicate entries');
    expect(all, contains(AppAssets.signature));
    expect(all, contains(AppAssets.me));
    expect(all, contains(AppAssets.cover));
  });
}
