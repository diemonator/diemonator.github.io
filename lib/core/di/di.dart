import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/app/app_di.dart';
import '../../features/contacts/contacts_di.dart';
import '../../features/home/home_di.dart';
import '../../features/main/main_di.dart';
import '../../features/portfolio/portfolio_di.dart';
import '../../features/profile/profile_di.dart';

/// A second `initDi` on a graph that already has one would throw on duplicate
/// keys — which is what a hot restart in a test harness does.
bool _initialized = false;

extension DiExtensions on GetIt {
  /// [sharedPreferences] is passed in rather than resolved here so tests can
  /// call `SharedPreferences.setMockInitialValues` and inject the result.
  Future<void> initDi(SharedPreferences sharedPreferences) async {
    if (_initialized) {
      return;
    }

    // Awaited first: every register below may resolve a settings repo.
    await registerSettings(sharedPreferences);

    registerMain();
    registerHome();
    registerPortfolio();
    registerProfile();
    registerContacts();

    _initialized = true;
  }

  /// Test seam: lets a suite build a fresh graph without tripping the guard.
  @visibleForTesting
  static void resetInitGuard() => _initialized = false;
}
