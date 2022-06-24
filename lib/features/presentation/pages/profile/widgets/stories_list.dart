import 'package:app_with_location/features/presentation/pages/profile/widgets/story_circle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class StoriesList extends StatelessWidget {
  const StoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mobile = ResponsiveWrapper.of(context).isMobile;

    return Container(
      height: 110,
      margin: EdgeInsets.only(top: mobile ? 15 : 35),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(
          width: 16,
        ),
        itemCount: 16,
        itemBuilder: (_, index) => const StoryCircle(),
      ),
    );
  }
}
