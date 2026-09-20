import 'package:get_it/get_it.dart';

import 'data/datasources/portfolio_local_data_source.dart';
import 'data/repositories/portfolio_repository_impl.dart';
import 'domain/repositories/portfolio_repository.dart';
import 'domain/services/portfolio_service.dart';
import 'domain/services/portfolio_service_impl.dart';
import 'presentation/bloc/portfolio_bloc.dart';
import 'presentation/bloc/portfolio_detail_bloc.dart';

extension PortfolioDiExtensions on GetIt {
  void registerPortfolio() {
    registerLazySingleton<PortfolioLocalDataSource>(
      PortfolioLocalDataSource.new,
    );
    registerLazySingleton<PortfolioRepository>(
      () => PortfolioRepositoryImpl(get<PortfolioLocalDataSource>()),
    );
    registerLazySingleton<PortfolioService>(
      () => PortfolioServiceImpl(get<PortfolioRepository>()),
    );
    registerFactory(() => PortfolioBloc(get<PortfolioService>()));
    registerFactory(() => PortfolioDetailBloc(get<PortfolioService>()));
  }
}
