import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/core/di/di.dart';
import 'package:portfolio/features/app/domain/repositories/app_settings_repo.dart';
import 'package:portfolio/features/app/domain/repositories/layout_setting_repo.dart';
import 'package:portfolio/features/app/domain/repositories/locale_setting_repo.dart';
import 'package:portfolio/features/app/domain/repositories/theme_setting_repo.dart';
import 'package:portfolio/features/app/domain/services/app_layout_service.dart';
import 'package:portfolio/features/app/domain/services/app_localization_service.dart';
import 'package:portfolio/features/app/domain/services/app_theme_service.dart';
import 'package:portfolio/features/app/presentation/bloc/app_bloc.dart';
import 'package:portfolio/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:portfolio/features/contacts/domain/services/contacts_service.dart';
import 'package:portfolio/features/contacts/presentation/bloc/contacts_bloc.dart';
import 'package:portfolio/features/home/domain/repositories/home_repository.dart';
import 'package:portfolio/features/home/domain/services/home_service.dart';
import 'package:portfolio/features/home/presentation/bloc/home_bloc.dart';
import 'package:portfolio/features/main/presentation/bloc/main_bloc.dart';
import 'package:portfolio/features/portfolio/domain/repositories/portfolio_repository.dart';
import 'package:portfolio/features/portfolio/domain/services/portfolio_service.dart';
import 'package:portfolio/features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'package:portfolio/features/portfolio/presentation/bloc/portfolio_detail_bloc.dart';
import 'package:portfolio/features/profile/domain/repositories/profile_repository.dart';
import 'package:portfolio/features/profile/domain/services/profile_service.dart';
import 'package:portfolio/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<GetIt> _register() async {
  await GetIt.I.reset();
  DiExtensions.resetInitGuard();
  await GetIt.I.initDi(await SharedPreferences.getInstance());

  return GetIt.I;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() => SharedPreferences.setMockInitialValues({}));
  tearDown(() async {
    await GetIt.I.reset();
    DiExtensions.resetInitGuard();
  });

  // Registering bare (`registerLazySingleton(() => FooImpl(...))`) keys on the
  // concrete type, which still type-checks — so only a resolution check
  // catches it, and it surfaces as a boot crash rather than an analyzer error.
  // Resolving each service walks its repository and datasource, so those are
  // covered transitively.
  test('resolves every service through its interface, not its impl', () async {
    final getIt = await _register();

    expect(getIt.call<AppThemeService>, returnsNormally);
    expect(getIt.call<AppLocalizationService>, returnsNormally);
    expect(getIt.call<AppLayoutService>, returnsNormally);
    expect(getIt.call<HomeService>, returnsNormally);
    expect(getIt.call<PortfolioService>, returnsNormally);
    expect(getIt.call<ProfileService>, returnsNormally);
    expect(getIt.call<ContactsService>, returnsNormally);
  });

  test('resolves every repository through its interface', () async {
    final getIt = await _register();

    expect(getIt.call<AppSettingsRepo>, returnsNormally);
    expect(getIt.call<ThemeSettingRepo>, returnsNormally);
    expect(getIt.call<LocaleSettingRepo>, returnsNormally);
    expect(getIt.call<LayoutSettingRepo>, returnsNormally);
    expect(getIt.call<HomeRepository>, returnsNormally);
    expect(getIt.call<PortfolioRepository>, returnsNormally);
    expect(getIt.call<ProfileRepository>, returnsNormally);
    expect(getIt.call<ContactsRepository>, returnsNormally);
  });

  // The blocs are where a missed registration actually surfaces: a service the
  // graph never resolves only crashes once the user opens that tab.
  test('builds every bloc the routes resolve', () async {
    final getIt = await _register();

    expect(getIt.call<AppBloc>, returnsNormally);
    expect(getIt.call<MainBloc>, returnsNormally);
    expect(getIt.call<HomeBloc>, returnsNormally);
    expect(getIt.call<PortfolioBloc>, returnsNormally);
    expect(getIt.call<PortfolioDetailBloc>, returnsNormally);
    expect(getIt.call<ProfileBloc>, returnsNormally);
    expect(getIt.call<ContactsBloc>, returnsNormally);
  });

  // The four settings interfaces are deliberately one object, so a theme
  // change and a locale change write to the same stored settings.
  test('the four settings interfaces share one instance', () async {
    final getIt = await _register();

    final repo = getIt<AppSettingsRepo>();

    expect(getIt<ThemeSettingRepo>(), same(repo));
    expect(getIt<LocaleSettingRepo>(), same(repo));
    expect(getIt<LayoutSettingRepo>(), same(repo));
  });

  test('initDi is idempotent, so a second call does not throw', () async {
    await _register();

    await expectLater(
      GetIt.I.initDi(await SharedPreferences.getInstance()),
      completes,
    );
  });
}
