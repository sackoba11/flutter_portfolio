import 'package:flutter/material.dart';

import 'article_card.dart';

class ArticleGrid extends StatelessWidget {
  const ArticleGrid({super.key, 
    required this.isMobile,
    required this.textColor,
    required this.muted,
  });

  final bool isMobile;
  final Color textColor;
  final Color muted;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 1 : 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: isMobile ? 1.2 : 1.5,
      ),
      itemBuilder: (context, index) {
        return ArticleCard(
          textColor: textColor,
          muted: muted,
          isMobile: isMobile,
        );
      },
    );
  }
}