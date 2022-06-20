import 'package:app_with_location/features/presentation/bloc/localization_bloc/localization_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatelessWidget {
  static const routeName = '/settings';

  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localization?.settings ?? 'No title'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: AppLocalizations.supportedLocales
              .map(
                (locale) => Row(
                  children: [
                    Checkbox(
                      value: locale.languageCode == localization?.localeName,
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
      ),
    );
  }
}
