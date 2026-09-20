import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/core/navigation/app_routes.dart';
import 'package:portfolio/features/portfolio/data/datasources/portfolio_local_data_source.dart';
import 'package:portfolio/features/portfolio/data/repositories/portfolio_repository_impl.dart';
import 'package:portfolio/features/portfolio/domain/services/portfolio_service_impl.dart';

void main() {
  const service = PortfolioServiceImpl(
    PortfolioRepositoryImpl(PortfolioLocalDataSource()),
  );

  test('exposes the portfolio tab children as categories', () {
    expect(service.categories, AppRoutes.portfolio.children);
  });

  test('resolves a category from its route name', () {
    expect(service.categoryByName('mobile'), AppRoutes.mobile);
    expect(service.categoryByName('databases'), AppRoutes.databases);
  });

  // A hand-typed URL, or the portfolio tab's own name, must not resolve to a
  // category — the detail page renders "under construction" instead.
  test('returns null for a name that is not a category', () {
    expect(service.categoryByName('nope'), isNull);
    expect(service.categoryByName('portfolio'), isNull);
    expect(service.categoryByName(null), isNull);
  });

  test('every category carries projects', () {
    for (final category in service.categories) {
      expect(
        service.projectsOf(category),
        isNotEmpty,
        reason: '${category.name} has no content',
      );
    }
  });
}
