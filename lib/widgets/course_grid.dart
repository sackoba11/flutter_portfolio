import 'package:flutter/material.dart';

import 'course_card.dart';

class CourseGrid extends StatelessWidget {
  const CourseGrid({
    super.key,
    required this.isMobile,
    required this.textColor,
    required this.muted,
  });

  final bool isMobile;
  final Color textColor;
  final Color muted;

  @override
  Widget build(BuildContext context) {
    final items = [1, 2, 3];
    return GridView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 1 : 3,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: isMobile ? 1.32 : 0.88,
      ),
      itemBuilder: (context, index) {
        return CourseCard(
          textColor: textColor,
          muted: muted,
          isMobile: isMobile,
        );
      },
    );
  }
}
