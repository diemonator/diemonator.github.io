import 'package:get_it/get_it.dart';

import 'data/datasources/home_local_data_source.dart';
import 'data/repositories/home_repository_impl.dart';
import 'domain/repositories/home_repository.dart';
import 'domain/services/home_service.dart';
import 'domain/services/home_service_impl.dart';
import 'presentation/bloc/home_bloc.dart';

extension HomeDiExtensions on GetIt {
  void registerHome() {
    registerLazySingleton<HomeLocalDataSource>(HomeLocalDataSource.new);
    registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(get<HomeLocalDataSource>()),
    );
    registerLazySingleton<HomeService>(
      () => HomeServiceImpl(get<HomeRepository>()),
    );
    registerFactory(() => HomeBloc(get<HomeService>()));
  }
}
