import '../../../../core/navigation/app_routes.dart';
import '../../domain/models/portfolio_project.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../datasources/portfolio_local_data_source.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  const PortfolioRepositoryImpl(this._dataSource);

  final PortfolioLocalDataSource _dataSource;

  @override
  List<AppRoutes> get categories => _dataSource.getCategories();

  @override
  List<PortfolioProject> projectsOf(AppRoutes category) =>
      _dataSource.getProjects(category);
}
