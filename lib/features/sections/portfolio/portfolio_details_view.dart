import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/media_query_extensions.dart';
import '../../../core/navigation/app_routes.dart';
import 'portfolio_apps.dart';

class PortfolioDetailsView extends StatelessWidget {
  const PortfolioDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmall = context.isScreenSmall;
    final routeName = GoRouter.of(context).state?.name;

    final route = AppRoutes.values.firstWhereOrNull(
      (route) => route.name == routeName,
    );

    final List<PortfolioApp> data = portfolioTechnologies.containsKey(route)
        ? portfolioTechnologies[route]!
        : const [];

    if (route == null || data.isEmpty) {
      return Scaffold(
        appBar: !kIsWeb ? AppBar() : null,
        body: const Center(child: Text('This page is under construction')),
      );
    }

    return Scaffold(
      appBar: !kIsWeb ? AppBar(title: Text(route.title)) : null,
      body: Column(
        children: [
          if (!isSmall)
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
            child: AnimationLimiter(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final PortfolioApp item = data[index];

                  return AnimationConfiguration.staggeredList(
                    position: index,
                    child: FadeInAnimation(
                      child: ScaleAnimation(
                        child: InkWell(
                          // onTap: () => launchUrlString(item.gitHubLink),
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
        ],
      ),
    );
  }
}
