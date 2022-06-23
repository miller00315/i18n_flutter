import 'package:app_with_location/features/presentation/pages/home/widgets/app_bar/web_app_bar_responsive_content.dart';
import 'package:app_with_location/features/presentation/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WebAppBar extends StatelessWidget {
  const WebAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 72,
      title: Row(
        children: [
          Text(AppLocalizations.of(context)?.appTitle ?? 'No title'),
          const SizedBox(
            width: 32,
          ),
          const WebAppBarResponsiveContent(),
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(SettingsPage.routeName),
            icon: const Icon(Icons.settings),
          ),
          const SizedBox(
            width: 24,
          ),
          SizedBox(
            height: 38,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  width: 2.0,
                  color: Colors.white,
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          SizedBox(
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {},
              child: Text(
                'Cadastre-se',
                style: TextStyle(
                  color: Theme.of(context).backgroundColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
