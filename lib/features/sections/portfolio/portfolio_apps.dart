import '../../../core/navigation/app_routes.dart';

class PortfolioApp {
  const PortfolioApp(this.title, this.description, this.gitHubLink);

  final String title;
  final String description;
  final String gitHubLink;
}

final portfolioTechnologies = {
  AppRoutes.flutter: [
    const PortfolioApp(
      'Imgur',
      'Imgur clone',
      'https://',
    ),
    const PortfolioApp(
      'Flutter modular template',
      'Flutter modular app with melos',
      'https://',
    ),
    const PortfolioApp(
      'Youtube clone',
      'At appolica I made a youtube clone for IP tv streaming',
      'https://',
    ),
    const PortfolioApp(
      'Flutter modular app',
      'At appolica I made a flutter modular app in a traditional approach without melos',
      '',
    ),
    const PortfolioApp(
      'Integrated flutter app in already existing native apps',
      'At appolica I made integrated a flutter application in to 3 native platforms: Android, iOS & Web',
      '',
    ),
    const PortfolioApp(
      'Flutter budgeting app',
      'Personal project',
      '',
    ),
    const PortfolioApp(
      'Portfolio',
      'This web site is made with flutter',
      '',
    ),
  ],
};
