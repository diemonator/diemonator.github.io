part of '../locator.dart';

Future<void> _setupAppFactories(GetIt globalLocator) async {
  globalLocator.registerFactory(
    () => AppCubit(
      appTheme: globalLocator(),
      appLocalization: globalLocator(),
    ),
  );
}
