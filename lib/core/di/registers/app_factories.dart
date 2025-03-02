part of '../locator.dart';

Future<void> _setupAppFactories(GetIt getIt) async {
  getIt
    ..registerFactory(
      () => AppBloc(
        appTheme: getIt(),
        appLocalization: getIt(),
        appLayoutService: getIt(),
      ),
    )
    ..registerFactory(MainBloc.new);
}
