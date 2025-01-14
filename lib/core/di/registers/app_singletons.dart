part of '../locator.dart';

Future<void> _setupAppSingletons(GetIt globalLocator) async {
  final sharedPreferences = await SharedPreferences.getInstance();

  final localStorage = LocalStorage(sharedPreferences);
  final appSettingsStorage = AppSettingsStorage(localStorage);
  final appSettings = await setupAppSettings(appSettingsStorage);
  final appSettingsRepo = AppSettingsRepoImpl(appSettingsStorage, appSettings);

  globalLocator
    ..registerLazySingleton<AppSettingsRepo>(() => appSettingsRepo)
    ..registerLazySingleton<ThemeSettingRepo>(() => appSettingsRepo)
    ..registerLazySingleton<LocaleSettingRepo>(() => appSettingsRepo)
    ..registerLazySingleton<LayoutSettingRepo>(() => appSettingsRepo)
    ..registerLazySingleton(() => AppThemeService(locator.get()))
    ..registerLazySingleton(() => AppLocalizationService(locator.get()))
    ..registerLazySingleton(() => AppLayoutService(locator.get()));
}
