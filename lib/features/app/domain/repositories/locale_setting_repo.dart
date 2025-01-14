import 'package:flutter/widgets.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class LocaleSettingRepo {
  Locale get locale;

  AsyncResult<Unit> saveLocale(Locale localeData);
}
