import '../../../../core/navigation/app_routes.dart';
import '../models/portfolio_project.dart';

abstract interface class PortfolioRepository {
  List<AppRoutes> get categories;

  List<PortfolioProject> projectsOf(AppRoutes category);
}
