sealed class MainEvent {
  const MainEvent();
}

final class MainNavigationEvent extends MainEvent {
  const MainNavigationEvent(this.index);

  final int index;
}

class MainSyncRouteEvent extends MainEvent {
  const MainSyncRouteEvent(this.path);

  final String path;
}
