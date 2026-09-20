import 'package:get_it/get_it.dart';

import 'presentation/bloc/main_bloc.dart';

extension MainDiExtensions on GetIt {
  void registerMain() {
    registerFactory(MainBloc.new);
  }
}
