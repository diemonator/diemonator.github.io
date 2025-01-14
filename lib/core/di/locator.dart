import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/app/data/datasources/local/app_settings_storage.dart';
import '../../features/app/data/repositories/app_settings_repo_impl.dart';
import '../../features/app/domain/services/app_localization.dart';
import '../../features/app/domain/services/app_theme.dart';
import '../../features/app/presentation/app_cubit.dart';
import '../local_storage/local_storage.dart';

part 'registers/app_factories.dart';
part 'registers/app_singletons.dart';

final locator = GetItWrapper(
  GetIt.I,
  initLocator: (getIt) async {
    await _setupAppSingletons(getIt);
    await _setupAppFactories(getIt);
  },
);

final class GetItWrapper {
  const GetItWrapper(
    this._current, {
    final Future<void> Function(GetIt current)? initLocator,
  }) : _initLocator = initLocator;

  final GetIt _current;
  final Future<void> Function(GetIt current)? _initLocator;

  T get<T extends Object>() => _current<T>();

  Future<void> initLocator() async {
    final initLocator = _initLocator;

    if (initLocator != null) {
      await initLocator(_current);
    }
  }
}
