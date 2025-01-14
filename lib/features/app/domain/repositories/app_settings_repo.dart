import 'package:result_dart/result_dart.dart';

import '../models/app_settings/app_settings.dart';

abstract interface class AppSettingsRepo {
  AppSettings get appSettings;

  AsyncResult<Unit> saveAppSettings(AppSettings appSettings);
}
