import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/extensions/language_extensions.dart';
import '../../../core/extensions/media_query_extensions.dart';
import '../../../core/themes/app_spacing.dart';
import '../../../core/themes/theme_extension.dart';
import '../../../core/widgets/animation_frame_fade.dart';
import '../domain/models/contact_method.dart';
import 'bloc/contacts_bloc.dart';
import 'bloc/contacts_event.dart';
import 'bloc/contacts_state.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    final isTabletSized = context.isTabletSizedScreen;

    return AnimationFrameFade(
      child: SingleChildScrollView(
        padding: context.contentPadding.copyWith(
          top: AppSpacing.xxl,
          bottom: AppSpacing.xxl,
        ),
        child: isTabletSized
            ? const Column(
                crossAxisAlignment: .start,
                children: [
                  _Title(),
                  SizedBox(height: AppSpacing.xxl),
                  _Details(),
                ],
              )
            : const Row(
                crossAxisAlignment: .start,
                children: [
                  Expanded(child: _Title()),
                  SizedBox(width: AppSpacing.xxxl),
                  Expanded(child: _Details()),
                ],
              ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    final lang = context.appLocalizations;

    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      children: [
        Text(
          lang.contacts.toUpperCase(),
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colors.primary,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        SelectableText(lang.getInTouch, style: context.textTheme.displayMedium),
        const SizedBox(height: AppSpacing.md),
        SelectableText(
          lang.sayHello,
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.colors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _Details extends StatelessWidget {
  const _Details();

  @override
  Widget build(BuildContext context) {
    final lang = context.appLocalizations;
    final bloc = context.read<ContactsBloc>();

    return BlocBuilder<ContactsBloc, ContactsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: .start,
          mainAxisSize: .min,
          children: [
            ...state.methods.map(
              (method) => _ContactRow(
                method: method,
                onTap: () => bloc.add(ContactsOpenMethodEvent(method)),
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              lang.follow.toUpperCase(),
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: state.links
                  .map(
                    (link) => IconButton.outlined(
                      onPressed: () => bloc.add(ContactsOpenLinkEvent(link)),
                      // The asset name is the only thing identifying the
                      // network, so it doubles as the accessible label.
                      tooltip: link.url,
                      icon: SvgPicture.asset(
                        link.svgPath,
                        height: 22,
                        width: 22,
                        colorFilter: ColorFilter.mode(
                          context.colors.onSurface,
                          .srcIn,
                        ),
                      ),
                    ),
                  )
                  .toList(growable: false),
            ),
          ],
        );
      },
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({required this.method, required this.onTap});

  final ContactMethod method;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final label = method.label;
    final text = label != null ? label(context.appLocalizations) : method.value;
    final isTappable = method.action != ContactAction.none;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: InkWell(
        onTap: isTappable ? onTap : null,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.sm,
            horizontal: AppSpacing.xs,
          ),
          child: Row(
            children: [
              Icon(
                method.icon,
                size: 20,
                color: context.colors.onSurfaceVariant,
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  text,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: isTappable
                        ? context.colors.onSurface
                        : context.colors.onSurfaceVariant,
                  ),
                ),
              ),
              if (isTappable)
                Icon(Icons.north_east, size: 16, color: context.colors.primary),
            ],
          ),
        ),
      ),
    );
  }
}
