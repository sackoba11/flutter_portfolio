import 'package:flutter/material.dart';

import '../presentation/views/home/screen/home_screen.dart';
import '../presentation/views/main/widgets/ghost_button.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.textColor,
    required this.muted,
    required this.isMobile,
  });

  final Color textColor;
  final Color muted;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final dark = isMobile;
    return Container(
      decoration: BoxDecoration(
        // color: dark ? HomeScreen.kCardDark : const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: dark ? Colors.white10 : Colors.black12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF1B1930),
                  Color(0xFF1D4E79),
                  Color(0xFF2A42AF),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Mixin in Dart',
            style: TextStyle(color: textColor, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          Text(
            'Lorem ipsum dolor sit amet consectetur. Urna egestas pulvinar.',
            style: TextStyle(color: muted, height: 1.4),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          GhostButton(label: 'Design'),
        ],
      ),
    );
  }
}
