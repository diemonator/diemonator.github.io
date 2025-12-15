import 'package:equatable/equatable.dart';

class MainState extends Equatable {
  const MainState({this.currentIndex = 0});

  final int currentIndex;

  MainState copyWith({int? currentIndex}) {
    return MainState(currentIndex: currentIndex ?? this.currentIndex);
  }

  @override
  List<Object> get props => [currentIndex];
}
