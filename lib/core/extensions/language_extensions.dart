import 'package:flutter/widgets.dart';

import '../localization/generated/app_localizations.dart';

extension LanguageExtensions on BuildContext {
  AppLocalizations get appLocalizations => AppLocalizations.of(this)!;
}
