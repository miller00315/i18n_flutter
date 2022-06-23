import 'package:app_with_location/config/break_points.dart';
import 'package:app_with_location/features/presentation/pages/home/widgets/app_bar/mobile_app_bar.dart';
import 'package:app_with_location/features/presentation/pages/home/widgets/app_bar/web_app_bar.dart';
import 'package:app_with_location/features/presentation/pages/home/widgets/sections/benefits_section.dart';
import 'package:app_with_location/features/presentation/pages/home/widgets/sections/courses_section.dart';
import 'package:app_with_location/features/presentation/pages/home/widgets/sections/top_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: constraints.maxWidth < mobileBreakPoint
              ? const PreferredSize(
                  preferredSize: Size(double.infinity, 56),
                  child: MobileAppBar(),
                )
              : const PreferredSize(
                  preferredSize: Size(double.infinity, 72),
                  child: WebAppBar(),
                ),
          drawer:
              constraints.maxWidth < mobileBreakPoint ? const Drawer() : null,
          body: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: tabletBreakPoint),
              child: ListView(
                children: const [
                  TopSection(),
                  BenefitsSection(),
                  CoursesSection(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
