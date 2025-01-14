import '../../features/app/data/datasources/local/app_settings_storage.dart';
import '../../features/app/domain/models/app_settings/app_settings.dart';
import '../utilities/localization_utilities.dart';
import '../utilities/theme_utilities.dart';

Future<AppSettings> setupAppSettings(
  AppSettingsStorage appSettingsStorage,
) async {
  final appSettings = appSettingsStorage.getAppSettings();

  if (appSettings == null) {
    final locale = LocalizationUtilities.getCurrentLocale();
    final defaultAppSettings = AppSettings(
      languageCode: locale.languageCode,
      countryCode: locale.countryCode,
      scriptCode: locale.scriptCode,
      theme: ThemeUtilities.systemTheme.name,
      isMobileLayoutEnabled: true,
    );

    await appSettingsStorage.saveAppSettings(appSettings: defaultAppSettings);

    return defaultAppSettings;
  }

  return appSettings;
}
