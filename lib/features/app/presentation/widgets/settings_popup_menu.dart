import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../core/constants/url_links.dart';
import '../../../../core/extensions/language_extensions.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/utilities/localization_utilities.dart';
import '../../../../core/utilities/platform_utilities.dart';
import '../app_bloc.dart';
import '../app_event.dart';
import '../app_state.dart';

class SettingsPopupMenu extends StatelessWidget {
  const SettingsPopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.appLocalizations;
    final appBloc = context.read<AppBloc>();

    return PopupMenuButton(
      icon: const Icon(Icons.settings),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(lang.darkMode),
            ),
            trailing: BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return Switch(
                  value: state.themeMode == ThemeMode.dark,
                  onChanged: (value) {
                    Navigator.pop(context);
                    appBloc.add(const ToggleThemeEvent());
                  },
                );
              },
            ),
          ),
        ),
        if (isRunningOnMobileWeb)
          PopupMenuItem(
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(lang.optimisedMobile),
              ),
              trailing: BlocBuilder<AppBloc, AppState>(
                builder: (context, state) {
                  return Switch(
                    value: state.isMobileLayoutEnabled,
                    onChanged: (value) {
                      Navigator.pop(context);
                      appBloc.add(
                        ToggleLayoutEvent(isMobileLayoutEnabled: value),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(lang.refresh)),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        PopupMenuItem(
          child: BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              return DropdownButton<Locale>(
                icon: const Icon(Icons.language),
                value: state.locale,
                isExpanded: true,
                padding: const EdgeInsets.all(8.0),
                onChanged: (Locale? newLocale) {
                  if (newLocale != null) {
                    Navigator.pop(context);
                    appBloc.add(ToggleLocalizationEvent(newLocale));
                  }
                },
                items: AppLocalizations.supportedLocales.map((locale) {
                  final languageCode = locale.languageCode;

                  return DropdownMenuItem(
                    value: Locale(languageCode),
                    child: Text(
                      LocalizationUtilities.getLanguageName(languageCode),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
        if (isRunningOnAndroidWeb)
          PopupMenuItem(
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(lang.downloadMobileApp),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.android, color: Colors.green.shade400),
              ),
            ),
            onTap: () async {
              if (await canLaunchUrlString(UrlLinks.githubApk)) {
                await launchUrlString(UrlLinks.githubApk);
              }
            },
          ),
      ],
    );
  }
}
