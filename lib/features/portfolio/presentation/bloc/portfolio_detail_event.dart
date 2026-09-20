sealed class PortfolioDetailEvent {
  const PortfolioDetailEvent();
}

/// [routeName] comes from the router, so it is whatever the URL contained.
final class PortfolioDetailLoadEvent extends PortfolioDetailEvent {
  const PortfolioDetailLoadEvent(this.routeName);

  final String? routeName;
}
