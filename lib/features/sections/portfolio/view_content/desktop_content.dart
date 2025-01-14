import '../../../../core/constants/app_assets.dart';
import '../../../../core/navigation/app_routes.dart';
import 'view_content.dart';

const MapEntry<AppRoutes, List<ViewContent>> desktopContent = MapEntry(
  AppRoutes.desktop,
  [
    ViewContent(
      svgLanguage: AppAssets.cSharp,
      svgImage: AppAssets.cSharp,
      title: 'Human Population Growth Simulation Populat.io',
      description: '''
Populat.io simulates human population growth using data and predictive models. It provides insights into future population trends, leveraging WPF for a graphical interface to visualize projections.

🔹 Key Features:
Data-Driven Predictions – Uses historical data to simulate population changes.
WPF Interface – Provides a visual representation of population growth over time.

🔹 Technology Stack:
C# and WPF for interactive simulation and data visualization.

A robust simulator for forecasting population growth trends using a graphical interface! 🌍📊''',
    ),
    ViewContent(
      title: 'BankBroker – Java-Based Loan Aggregator with JavaFX Frontend',
      svgLanguage: AppAssets.java,
      svgImage: AppAssets.java,
      description: '''
BankBroker is a Java-based loan aggregation system that connects customers with multiple banks. The JavaFX frontend provides an intuitive user interface for clients to view loan options and apply seamlessly.

🔹 Key Features:
Bank Communication – Integrates with multiple banks to fetch loan offers.
JavaFX Interface – Offers a sleek, interactive front-end for an enhanced user experience.

🔹 Technology Stack:
Java for backend processing.
JavaFX for the graphical user interface.

An efficient loan aggregation system with a user-friendly JavaFX interface! 💳🏦''',
    ),
  ],
);
