import 'package:equatable/equatable.dart';

final class Technology extends Equatable {
  const Technology(this.title, this.svgPath);

  final String title;
  final String svgPath;

  @override
  List<Object> get props => [title, svgPath];
}
