import '../../../../core/navigation/app_routes.dart';
import '../../domain/models/portfolio_project.dart';
import 'content/backend_content.dart';
import 'content/databases_content.dart';
import 'content/desktop_content.dart';
import 'content/mobile_content.dart';

/// Compiled-in content, keyed by the category route it belongs to.
/// ponytail: concrete, no interface — see [HomeLocalDataSource].
class PortfolioLocalDataSource {
  const PortfolioLocalDataSource();

  static final Map<AppRoutes, List<PortfolioProject>> _byCategory =
      Map.unmodifiable(
        Map.fromEntries([
          mobileContent,
          backendContent,
          desktopContent,
          databasesContent,
        ]),
      );

  List<AppRoutes> getCategories() => AppRoutes.portfolio.children;

  List<PortfolioProject> getProjects(AppRoutes category) =>
      _byCategory[category] ?? const [];
}
