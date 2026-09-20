import 'package:equatable/equatable.dart';

import '../../../../core/navigation/app_routes.dart';

/// A category plus how many projects sit behind it, so the grid does not have
/// to reach back into the service to label a card.
typedef PortfolioCategory = ({AppRoutes route, int projectCount});

class PortfolioState extends Equatable {
  const PortfolioState({this.categories = const []});

  final List<PortfolioCategory> categories;

  @override
  List<Object> get props => [categories];
}
