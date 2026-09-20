import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/local_storage/local_storage.dart';
import '../../core/local_storage/setup_localstorage.dart';
import 'data/datasources/local/app_settings_storage.dart';
import 'data/repositories/app_settings_repo_impl.dart';
import 'domain/repositories/app_settings_repo.dart';
import 'domain/repositories/layout_setting_repo.dart';
import 'domain/repositories/locale_setting_repo.dart';
import 'domain/repositories/theme_setting_repo.dart';
import 'domain/services/app_layout_service.dart';
import 'domain/services/app_localization_service.dart';
import 'domain/services/app_theme_service.dart';
import 'presentation/bloc/app_bloc.dart';

extension AppDiExtensions on GetIt {
  /// The settings store, awaited: every other register may resolve it.
  /// [sharedPreferences] is injected rather than fetched here, so tests can
  /// hand in mock values without a platform channel.
  Future<void> registerSettings(SharedPreferences sharedPreferences) async {
    final storage = AppSettingsStorage(LocalStorage(sharedPreferences));
    final settings = await setupAppSettings(storage);
    final repo = AppSettingsRepoImpl(storage, settings);

    // One object behind four interfaces: each service depends only on the
    // slice it uses, and a fake can replace one without the others.
    registerSingleton<AppSettingsRepo>(repo);
    registerSingleton<ThemeSettingRepo>(repo);
    registerSingleton<LocaleSettingRepo>(repo);
    registerSingleton<LayoutSettingRepo>(repo);

    registerLazySingleton<AppThemeService>(
      () => AppThemeService(get<ThemeSettingRepo>()),
    );
    registerLazySingleton<AppLocalizationService>(
      () => AppLocalizationService(get<LocaleSettingRepo>()),
    );
    registerLazySingleton<AppLayoutService>(
      () => AppLayoutService(get<LayoutSettingRepo>()),
    );

    registerFactory(
      () => AppBloc(
        appTheme: get<AppThemeService>(),
        appLocalization: get<AppLocalizationService>(),
        appLayoutService: get<AppLayoutService>(),
      ),
    );
  }
}
