import 'package:get_it/get_it.dart';

import 'data/datasources/profile_local_data_source.dart';
import 'data/repositories/profile_repository_impl.dart';
import 'domain/repositories/profile_repository.dart';
import 'domain/services/profile_service.dart';
import 'domain/services/profile_service_impl.dart';
import 'presentation/bloc/profile_bloc.dart';

extension ProfileDiExtensions on GetIt {
  void registerProfile() {
    registerLazySingleton<ProfileLocalDataSource>(ProfileLocalDataSource.new);
    registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(get<ProfileLocalDataSource>()),
    );
    registerLazySingleton<ProfileService>(
      () => ProfileServiceImpl(get<ProfileRepository>()),
    );
    registerFactory(() => ProfileBloc(get<ProfileService>()));
  }
}
