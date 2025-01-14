import 'dart:ui';

sealed class LocalizationUtilities {
  static const defaultLanguageCode = 'en';
  static const Map<String, String> supportedLanguageMap = {
    'en': 'English',
    'bg': 'Български',
  };

  static final systemDefaultLanguageCode =
      PlatformDispatcher.instance.locale.languageCode;

  static String getLanguageName(String languageCode) {
    return supportedLanguageMap[languageCode]!;
  }

  static Locale getCurrentLocale() {
    if (supportedLanguageMap.containsKey(systemDefaultLanguageCode)) {
      return Locale(systemDefaultLanguageCode);
    }

    return const Locale(defaultLanguageCode);
  }
}
