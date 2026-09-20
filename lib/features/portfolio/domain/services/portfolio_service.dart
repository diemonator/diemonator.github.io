import '../../../../core/navigation/app_routes.dart';
import '../models/portfolio_project.dart';

abstract interface class PortfolioService {
  List<AppRoutes> get categories;

  List<PortfolioProject> projectsOf(AppRoutes category);

  /// Resolves the category a route *name* refers to, for the detail route's
  /// path param. Null when the name is not a portfolio child.
  AppRoutes? categoryByName(String? name);
}
