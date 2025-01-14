import 'package:flutter_bloc/flutter_bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<MainNavigationEvent>(
      (event, emit) => emit(MainState(currentIndex: event.index)),
    );
  }
}

class MainState {
  const MainState({this.currentIndex = 0});

  final int currentIndex;
}

sealed class MainEvent {
  const MainEvent();
}

final class MainNavigationEvent extends MainEvent {
  const MainNavigationEvent(this.index);

  final int index;
}
