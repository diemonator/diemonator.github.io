import 'package:flutter/widgets.dart';
import 'package:result_dart/result_dart.dart';

import '../repositories/locale_setting_repo.dart';

final class AppLocalizationService extends ChangeNotifier {
  AppLocalizationService(this._localeSettingsRepo);

  final LocaleSettingRepo _localeSettingsRepo;

  Locale get currentLocalization => _localeSettingsRepo.locale;

  Future<void> changeLocale(Locale locale) async {
    if (locale != currentLocalization) {
      await _localeSettingsRepo
          .saveLocale(Locale(locale.languageCode, locale.countryCode))
          .onSuccess((_) => notifyListeners());
    }
  }
}
