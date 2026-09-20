import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/services/home_service.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._homeService) : super(const HomeState()) {
    on<HomeLoadEvent>(_onLoad);

    add(const HomeLoadEvent());
  }

  final HomeService _homeService;

  void _onLoad(HomeLoadEvent event, Emitter<HomeState> emit) {
    emit(
      HomeState(
        technologies: _homeService.technologies,
        programmingLanguages: _homeService.programmingLanguages,
      ),
    );
  }
}
