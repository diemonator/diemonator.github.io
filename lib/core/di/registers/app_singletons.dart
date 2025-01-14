part of '../locator.dart';

Future<void> _setupAppSingletons(GetIt globalLocator) async {
  final sharedPreferences = await SharedPreferences.getInstance();

  final localStorage = LocalStorage(sharedPreferences);
  final appStorage = AppSettingsStorage(localStorage);
  final appSettingsRepo = AppSettingsRepoImpl(appStorage);

  globalLocator
    ..registerLazySingleton(() => AppTheme(appSettingsRepo))
    ..registerLazySingleton(() => AppLocalization(appSettingsRepo));
}
