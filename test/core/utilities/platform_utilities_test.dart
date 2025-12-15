import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/core/utilities/platform_utilities.dart';

void main() {
  group('PlatformUtilities', () {
    test('isRunningOnMobileWeb returns false on VM (default)', () {
      // In VM tests, kIsWeb is false.
      expect(isRunningOnMobileWeb, false);
    });

    test('isRunningOnAndroidWeb returns false on VM (default)', () {
      expect(isRunningOnAndroidWeb, false);
    });
  });
}
