import 'package:flutter/material.dart';

import '../views/home/views/home_screen.dart';
import 'primary_button.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
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
        color: dark ? HomeScreen.kCardDark : const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: dark ? Colors.white10 : Colors.black12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF1D1A2F),
                  Color(0xFF1A4E7A),
                  Color(0xFF2935A0),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Center(
              child: Text(
                'Mixin in Dart',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Mixin in Dart',
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Lorem ipsum dolor sit amet consectetur. Ut aliquet lacus urna.',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: muted, height: 1.4, fontSize: 13),
          ),
          const SizedBox(height: 10),
          const PrimaryButton(label: 'Learn More', isMobile: false),
        ],
      ),
    );
  }
}
