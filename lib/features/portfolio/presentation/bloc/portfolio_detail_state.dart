import 'package:equatable/equatable.dart';

import '../../domain/models/portfolio_project.dart';

class PortfolioDetailState extends Equatable {
  const PortfolioDetailState({this.title = '', this.projects = const []});

  final String title;
  final List<PortfolioProject> projects;

  /// Drives the "under construction" copy: a real category with no projects
  /// yet, or a URL that matched nothing.
  bool get isEmpty => projects.isEmpty;

  @override
  List<Object> get props => [title, projects];
}
