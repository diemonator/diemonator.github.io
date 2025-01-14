import '../../../../core/navigation/app_routes.dart';
import 'backend_content.dart';
import 'databases_content.dart';
import 'desktop_content.dart';
import 'mobile_content.dart';

class ViewContent {
  const ViewContent({
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
}

final Map<AppRoutes, List<ViewContent>> portfolioTechnologies = Map.fromEntries(
  [
    mobileContent,
    backendContent,
    desktopContent,
    databasesContent,
  ],
);
