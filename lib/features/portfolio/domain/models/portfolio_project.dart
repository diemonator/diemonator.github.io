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

  @override
  List<Object?> get props => [
    title,
    description,
    svgLanguage,
    svgImage,
    gitHubLink,
  ];
}
