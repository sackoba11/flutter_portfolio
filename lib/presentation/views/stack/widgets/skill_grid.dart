import 'package:flutter/material.dart';

import 'stack_card.dart';

class SkillGrid extends StatelessWidget {
  const SkillGrid({
    super.key,
    required List<Map<String, Object>> stackItems,
    required this.isMobile,
  }) : _stackItems = stackItems;

  final List<Map<String, Object>> _stackItems;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _stackItems.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 1 : 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: isMobile ? 1.1 : 1.05,
      ),
      itemBuilder: (context, index) {
        final item = _stackItems[index];
        return StackCard(
          title: item['title'] as String,
          description: item['description'] as String,
          skills: List<String>.from(item['skills'] as List<String>),
        );
      },
    );
  }
}
