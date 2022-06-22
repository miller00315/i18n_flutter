import 'package:app_with_location/features/presentation/bloc/localization_bloc/localization_bloc.dart';
import 'package:app_with_location/features/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:app_with_location/features/presentation/screens/home/home.dart';
import 'package:app_with_location/features/presentation/screens/settings/settings.dart';
import 'package:app_with_location/injection_container.dart';
import 'package:device_preview/device_preview.dart';
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
          create: (_) => serviceLocator<LocalizationBloc>()
            ..add(
              GetCurrentLocalization(),
            ),
        ),
        BlocProvider(
          create: (_) => serviceLocator<ThemeBloc>()
            ..add(
              GetCurrentThemeEvent(),
            ),
        ),
      ],
      child: buildWithInheritedStates(),
    );
  }

  Widget buildWithInheritedStates() {
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (_, localeState) => BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) => mainWidget(
          context,
          localeState,
          themeState,
        ),
      ),
    );
  }

  Widget mainWidget(
    BuildContext context,
    LocalizationState localeState,
    ThemeState themeState,
  ) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      locale: localeState.locale,
      onGenerateTitle: (_) =>
          AppLocalizations.of(context)?.appTitle ?? 'Cant access title',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: themeState.themeData,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        Settings.routeName: (context) => const Settings(),
      },
    );
  }
}
