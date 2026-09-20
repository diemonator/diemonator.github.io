import 'package:equatable/equatable.dart';

final class PortfolioProject extends Equatable {
  const PortfolioProject({
    required this.title,
    required this.description,
    required this.svgLanguage,
    required this.svgImage,
    this.gitHubLink,
  });

  final String title;
  final String description;
  final String svgLanguage;
  final String svgImage;
  final String? gitHubLink;

  /// Empty strings live in the content, so treat them as "no link" rather than
  /// rendering a button that goes nowhere.
  bool get hasGitHubLink => gitHubLink != null && gitHubLink!.isNotEmpty;

  @override
  List<Object?> get props => [
    title,
    description,
    svgLanguage,
    svgImage,
    gitHubLink,
  ];
}
