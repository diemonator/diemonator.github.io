class MainState {
  const MainState({this.currentIndex = 0});

  final int currentIndex;

  MainState copyWith({int? currentIndex}) {
    return MainState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
