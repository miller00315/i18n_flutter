import 'package:app_with_location/features/presentation/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MobileAppBar extends StatelessWidget {
  const MobileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context)?.appTitle ?? 'No title'),
      centerTitle: true,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(
          onPressed: () =>
              Navigator.of(context).pushNamed(SettingsPage.routeName),
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }
}
