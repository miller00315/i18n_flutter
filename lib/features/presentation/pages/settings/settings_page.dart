import 'package:app_with_location/features/presentation/bloc/localization_bloc/localization_bloc.dart';
import 'package:app_with_location/features/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:app_with_location/features/presentation/global/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localization?.settings ?? 'No title'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: AppLocalizations.supportedLocales
                  .map(
                    (locale) => Row(
                      children: [
                        Checkbox(
                          value:
                              locale.languageCode == localization?.localeName,
                          onChanged: (_) =>
                              BlocProvider.of<LocalizationBloc>(context).add(
                            ChangeLocalizationEvent(locale),
                          ),
                        ),
                        Text(locale.languageCode),
                      ],
                    ),
                  )
                  .toList(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: AppTheme.values
                  .map(
                    (theme) => Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: appThemeData[theme]?.elevatedButtonTheme.style,
                          onPressed: () =>
                              BlocProvider.of<ThemeBloc>(context).add(
                            ThemeChangedEvent(theme),
                          ),
                          child: Text(theme.name),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
