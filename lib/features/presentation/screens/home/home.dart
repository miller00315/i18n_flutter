import 'package:app_with_location/features/presentation/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.appTitle ?? 'No title'),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(Settings.routeName),
            icon: const Icon(Icons.menu),
          )
        ],
      ),
      body: Container(),
    );
  }
}
