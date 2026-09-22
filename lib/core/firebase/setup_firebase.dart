import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

import '../../firebase_options.dart';

Future<void> setupFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Not awaited: the first frame does not depend on the ping landing, and on
  // web this round trip sits directly in front of it.
  unawaited(
    FirebaseAnalytics.instance.logAppOpen(
      callOptions: AnalyticsCallOptions(global: true),
    ),
  );

  // firebase_crashlytics ships no web implementation, so wiring these handlers
  // there turns every Flutter error into a plugin exception on top of it.
  if (kIsWeb) {
    return;
  }

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);

    return true;
  };
}
