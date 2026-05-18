import 'package:flutter/material.dart';

import 'pricing_card.dart';

class PricingGrid extends StatelessWidget {
  const PricingGrid({
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
    final plans = [
      ('Basic', '\$100'),
      ('Pro', '\$500'),
      ('Pro Plus', '\$2000'),
    ];
    return GridView.builder(
      itemCount: plans.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 1 : 3,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: isMobile ? 1.4 : 0.9,
      ),
      itemBuilder: (context, index) {
        final plan = plans[index];
        return PricingCard(
          plan: plan.$1,
          price: plan.$2,
          textColor: textColor,
          muted: muted,
          isMobile: isMobile,
        );
      },
    );
  }
}
