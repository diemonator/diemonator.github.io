import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../core/navigation/app_routes.dart';
import 'portfolio_apps.dart';

class PortfolioDetailsView extends StatelessWidget {
  const PortfolioDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.sizeOf(context).width < 600;
    final columnCount = isSmall ? 1 : 2;
    final routeName = GoRouter.of(context).state!.name;

    final route = AppRoutes.values.firstWhere(
      (route) => route.name == routeName,
    );

    final data = dic[route]!;

    return Scaffold(
      appBar: isSmall ? AppBar(title: Text(route.title)) : null,
      body: Column(
        children: [
          if (!isSmall) SelectableText(route.title),
          Expanded(
            child: AnimationLimiter(
              child: GridView.count(
                crossAxisCount: columnCount,
                children: List.generate(
                  AppRoutes.portfolio.children.length,
                  (index) {
                    final PortfolioApp item = data[index];

                    return AnimationConfiguration.staggeredGrid(
                      columnCount: columnCount,
                      position: index,
                      child: FadeInAnimation(
                        child: ScaleAnimation(
                          child: InkWell(
                            onTap: () => launchUrlString(item.gitHubLink),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    SelectableText(item.title),
                                    const Gap(16),
                                    SelectableText(item.description),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
