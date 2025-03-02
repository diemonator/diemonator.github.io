import 'package:flutter/foundation.dart';

bool get isRunningOnMobileWeb =>
    kIsWeb &&
    (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS);

bool get isRunningOnAndroidWeb =>
    kIsWeb && defaultTargetPlatform == TargetPlatform.android;
