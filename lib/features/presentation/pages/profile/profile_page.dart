import 'package:app_with_location/features/presentation/pages/profile/widgets/post_widget.dart';
import 'package:app_with_location/features/presentation/pages/profile/widgets/responsive_app_bar.dart';
import 'package:app_with_location/features/presentation/pages/profile/widgets/right_panel.dart';
import 'package:app_with_location/features/presentation/pages/profile/widgets/stories_list.dart';
import 'package:flutter/material.dart';

import 'package:responsive_framework/responsive_framework.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper.builder(
      ClampingScrollWrapper.builder(context, content(context)),
      defaultScale: true,
      minWidth: 450,
      defaultName: MOBILE,
      breakpoints: [
        const ResponsiveBreakpoint.resize(450, name: MOBILE),
        const ResponsiveBreakpoint.resize(700, name: TABLET),
        const ResponsiveBreakpoint.resize(800, name: DESKTOP),
      ],
    );
  }

  Widget content(context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(
          double.infinity,
          52,
        ),
        child: ResponsiveAppBar(),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            children: [
              Expanded(
                child: ListView(
                  children: const [
                    StoriesList(),
                    PostWidget(),
                    PostWidget(),
                    PostWidget(),
                  ],
                ),
              ),
              const RightPanel(),
            ],
          ),
        ),
      ),
    );
  }
}
