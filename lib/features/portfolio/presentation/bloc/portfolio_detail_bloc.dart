import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/services/portfolio_service.dart';
import 'portfolio_detail_event.dart';
import 'portfolio_detail_state.dart';

class PortfolioDetailBloc
    extends Bloc<PortfolioDetailEvent, PortfolioDetailState> {
  PortfolioDetailBloc(this._portfolioService)
    : super(const PortfolioDetailState()) {
    on<PortfolioDetailLoadEvent>(_onLoad);
  }

  final PortfolioService _portfolioService;

  void _onLoad(
    PortfolioDetailLoadEvent event,
    Emitter<PortfolioDetailState> emit,
  ) {
    final category = _portfolioService.categoryByName(event.routeName);

    if (category == null) {
      emit(const PortfolioDetailState());

      return;
    }

    emit(
      PortfolioDetailState(
        title: category.title,
        projects: _portfolioService.projectsOf(category),
      ),
    );
  }
}
