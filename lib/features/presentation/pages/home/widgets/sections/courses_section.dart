import 'package:app_with_location/config/break_points.dart';
import 'package:app_with_location/features/presentation/pages/home/widgets/course_item.dart';
import 'package:flutter/material.dart';

class CoursesSection extends StatelessWidget {
  const CoursesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => GridView.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: constraints.maxWidth >= tabletBreakPoint ? 0 : 16,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => const CourseItem(),
      ),
    );
  }
}
