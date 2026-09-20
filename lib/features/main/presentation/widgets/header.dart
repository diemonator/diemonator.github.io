import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/navigation/app_routes.dart';
import '../../../../core/themes/app_spacing.dart';
import '../../../../core/themes/theme_extension.dart';
import '../../../app/presentation/widgets/settings_popup_menu.dart';
import '../bloc/main_bloc.dart';
import '../bloc/main_event.dart';
import 'route_title.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.colors.outlineVariant),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        ),
        child: Row(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              onTap: () {
                context.goNamed(AppRoutes.home.name);
                context.read<MainBloc>().add(
                  MainSyncRouteEvent(AppRoutes.home.path),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.xs),
                child: SvgPicture.asset(
                  AppAssets.signature,
                  height: 40,
                  // The traced paths fill with currentColor, so one filter
                  // recolours the mark for either theme.
                  colorFilter: ColorFilter.mode(
                    context.colors.onSurface,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            const Spacer(),
            const RouteTitle(),
            const Spacer(),
            const SettingsPopupMenu(),
          ],
        ),
      ),
    );
  }
}
