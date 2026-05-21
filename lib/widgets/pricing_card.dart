import 'package:flutter/material.dart';

import '../presentation/views/home/views/home_screen.dart';
import 'feature_item.dart';
import '../presentation/widgets/primary_button.dart';
import 'tag.dart';

class PricingCard extends StatelessWidget {
  const PricingCard({
    super.key,
    required this.plan,
    required this.price,
    required this.textColor,
    required this.muted,
    required this.isMobile,
  });

  final String plan;
  final String price;
  final Color textColor;
  final Color muted;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final dark = isMobile;
    return Container(
      decoration: BoxDecoration(
        color: dark ? HomeScreen.kCardDark : const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: dark ? Colors.white10 : Colors.black12),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Tag(label: plan),
          const SizedBox(height: 12),
          Text(
            price,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w800,
              fontSize: 38,
            ),
          ),
          Text('/ month', style: TextStyle(color: muted, fontSize: 14)),
          const SizedBox(height: 14),
          ...const [
            FeatureItem(text: 'Video lessons'),
            FeatureItem(text: 'Source code'),
            FeatureItem(text: 'Live support'),
            FeatureItem(text: 'Bonus assets'),
          ],
          const Spacer(),
          const PrimaryButton(label: 'Get Started', isMobile: false),
        ],
      ),
    );
  }
}
