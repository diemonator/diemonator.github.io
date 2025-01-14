import 'package:flutter/widgets.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class LocaleSettingsRepo {
  Locale get locale;

  AsyncResult<Unit> saveLocale(Locale localeData);
}
