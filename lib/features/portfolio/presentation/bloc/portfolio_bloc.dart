import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/services/portfolio_service.dart';
import 'portfolio_event.dart';
import 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc(this._portfolioService) : super(const PortfolioState()) {
    on<PortfolioLoadEvent>(_onLoad);

    add(const PortfolioLoadEvent());
  }

  final PortfolioService _portfolioService;

  void _onLoad(PortfolioLoadEvent event, Emitter<PortfolioState> emit) {
    emit(
      PortfolioState(
        categories: _portfolioService.categories
            .map(
              (route) => (
                route: route,
                projectCount: _portfolioService.projectsOf(route).length,
              ),
            )
            .toList(growable: false),
      ),
    );
  }
}
