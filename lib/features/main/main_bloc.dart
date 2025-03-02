import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/navigation/app_routes.dart';
import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<MainNavigationEvent>(
      (event, emit) => emit(MainState(currentIndex: event.index)),
    );
    on<MainSyncRouteEvent>((event, emit) {
      final index = AppRoutes.tabs.indexWhere(
        (tab) => event.path.startsWith(tab.path),
      );

      if (index != -1 && state.currentIndex != index) {
        emit(state.copyWith(currentIndex: index));
      }
    });
  }
}
