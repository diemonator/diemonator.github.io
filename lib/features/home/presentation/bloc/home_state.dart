import 'package:equatable/equatable.dart';

import '../../domain/models/technology.dart';

class HomeState extends Equatable {
  const HomeState({
    this.technologies = const [],
    this.programmingLanguages = const [],
  });

  final List<Technology> technologies;
  final List<Technology> programmingLanguages;

  @override
  List<Object> get props => [technologies, programmingLanguages];
}
