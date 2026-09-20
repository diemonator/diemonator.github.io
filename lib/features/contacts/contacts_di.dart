import 'package:get_it/get_it.dart';

import 'data/datasources/contacts_local_data_source.dart';
import 'data/repositories/contacts_repository_impl.dart';
import 'domain/repositories/contacts_repository.dart';
import 'domain/services/contacts_service.dart';
import 'domain/services/contacts_service_impl.dart';
import 'presentation/bloc/contacts_bloc.dart';

extension ContactsDiExtensions on GetIt {
  void registerContacts() {
    registerLazySingleton<ContactsLocalDataSource>(ContactsLocalDataSource.new);
    registerLazySingleton<ContactsRepository>(
      () => ContactsRepositoryImpl(get<ContactsLocalDataSource>()),
    );
    registerLazySingleton<ContactsService>(
      () => ContactsServiceImpl(get<ContactsRepository>()),
    );
    registerFactory(() => ContactsBloc(get<ContactsService>()));
  }
}
