import 'package:app_with_location/features/presentation/bloc/localization_bloc/localization_bloc.dart';
import 'package:app_with_location/features/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:app_with_location/features/presentation/pages/home/home_page.dart';
import 'package:app_with_location/features/presentation/pages/profile/profile_page.dart';
import 'package:app_with_location/features/presentation/pages/settings/settings_page.dart';
import 'package:app_with_location/injection_container.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
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
        child: buildWithInheritedBlocStates(),
      );

  Widget buildWithInheritedBlocStates() =>
      BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (_, localeState) => BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) => buildWidgetWithInheritedStates(
            context,
            localeState,
            themeState,
          ),
        ),
      );

  Widget buildWidgetWithInheritedStates(
    BuildContext context,
    LocalizationState localeState,
    ThemeState themeState,
  ) =>
      MaterialApp(
        builder: DevicePreview.appBuilder,
        locale: localeState.locale,
        onGenerateTitle: (_) =>
            AppLocalizations.of(context)?.appTitle ?? 'Cant access title',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: themeState.themeData,
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (_) => const HomePage(),
          SettingsPage.routeName: (_) => const SettingsPage(),
          ProfilePage.routeName: (_) => const ProfilePage(),
        },
      );
}
