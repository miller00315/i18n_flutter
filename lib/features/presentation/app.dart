import 'package:app_with_location/features/presentation/bloc/localization_bloc/localization_bloc.dart';
import 'package:app_with_location/features/presentation/screens/home/home.dart';
import 'package:app_with_location/features/presentation/screens/settings/settings.dart';
import 'package:app_with_location/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<LocalizationBloc>()
            ..add(
              GetCurrentLocalization(),
            ),
        ),
      ],
      child: BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, state) => MaterialApp(
          locale: state.locale,
          onGenerateTitle: (_) =>
              AppLocalizations.of(context)?.appTitle ?? 'Cant access title',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData(primarySwatch: Colors.blue),
          initialRoute: '/',
          routes: {
            '/': (context) => const Home(),
            Settings.routeName: (context) => const Settings(),
          },
        ),
      ),
    );
  }
}
