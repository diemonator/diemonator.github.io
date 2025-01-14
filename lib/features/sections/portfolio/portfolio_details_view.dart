import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/language_extensions.dart';
import '../../../core/extensions/media_query_extensions.dart';
import '../../../core/navigation/app_routes.dart';
import 'view_content/view_content.dart';
import 'widgets/portfolio_list_view.dart';

class PortfolioDetailsView extends StatelessWidget {
  const PortfolioDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobileScreen = context.isMobileScreen;
    final isTabletSizedScreen = context.isTabletSizedScreen;
    final routeName = GoRouter.of(context).state.name;
    final width = context.screenWidth / 20;

    final route = AppRoutes.portfolio.children.firstWhere(
      (route) => route.name == routeName,
    );

    final List<ViewContent> data = portfolioTechnologies.containsKey(route)
        ? portfolioTechnologies[route] ?? []
        : const [];

    if (data.isEmpty) {
      return Scaffold(
        appBar: isMobileScreen ? AppBar() : null,
        body: Center(child: Text(context.appLocalizations.underConstruction)),
      );
    }

    return Scaffold(
      appBar: isMobileScreen ? AppBar(title: Text(route.title)) : null,
      body: Column(
        children: [
          if (!isMobileScreen)
            SizedBox(
              height: 80,
              child: Center(
                child: SelectableText(
                  route.title,
                  style: const TextStyle(fontSize: 28),
                ),
              ),
            ),
          Expanded(
            child: PortfolioListView(
              data: data,
              isTabletSizedScreen: isTabletSizedScreen,
              width: width,
            ),
          ),
        ],
      ),
    );
  }
}
