import 'package:flutter/widgets.dart';
import 'package:result_dart/result_dart.dart';

import '../repositories/locale_settings_repo.dart';

final class AppLocalization extends ChangeNotifier {
  AppLocalization(this._localeSettingsRepo)
      : _currentLocale = _localeSettingsRepo.locale;

  final LocaleSettingsRepo _localeSettingsRepo;

  Locale _currentLocale;

  Locale get currentLocalization => _currentLocale;

  AsyncResult<Unit> changeLocale(Locale locale) {
    return _localeSettingsRepo
        .saveLocale(Locale(locale.languageCode, locale.countryCode))
        .onSuccess((_) {
      _currentLocale = locale;
      notifyListeners();
    });
  }
}
