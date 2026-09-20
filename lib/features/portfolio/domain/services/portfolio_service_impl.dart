import 'package:collection/collection.dart';

import '../../../../core/navigation/app_routes.dart';
import '../models/portfolio_project.dart';
import '../repositories/portfolio_repository.dart';
import 'portfolio_service.dart';

class PortfolioServiceImpl implements PortfolioService {
  const PortfolioServiceImpl(this._repository);

  final PortfolioRepository _repository;

  @override
  List<AppRoutes> get categories => _repository.categories;

  @override
  List<PortfolioProject> projectsOf(AppRoutes category) =>
      _repository.projectsOf(category);

  @override
  AppRoutes? categoryByName(String? name) =>
      categories.firstWhereOrNull((category) => category.name == name);
}
