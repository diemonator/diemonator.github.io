part of '../locator.dart';

Future<void> _setupAppFactories(GetIt getIt) async {
  getIt
    ..registerFactory(
      () => AppCubit(
        appTheme: getIt(),
        appLocalization: getIt(),
        appLayoutService: getIt(),
      ),
    )
    ..registerFactory(MainBloc.new);
}
