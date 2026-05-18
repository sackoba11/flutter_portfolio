import 'package:flutter/material.dart';

import 'ghost_button.dart';
import 'primary_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.isMobile,
    required this.textColor,
    required this.mutedTextColor,
  });

  final bool isMobile;
  final Color textColor;
  final Color mutedTextColor;

  @override
  Widget build(BuildContext context) {
    final avatarSize = isMobile ? 180.0 : 220.0;
    return Wrap(
      runSpacing: 24,
      spacing: 30,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Container(
          width: avatarSize,
          height: avatarSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFF221932), Color(0xFF7E3BFF), Color(0xFF0F0B18)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(
              color: isMobile ? Colors.white24 : Colors.black12,
            ),
          ),
          child: const Icon(Icons.person, size: 84, color: Colors.white70),
        ),
        SizedBox(
          width: isMobile ? 330 : 680,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Flutter Developer blia blia',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: isMobile ? 24 : 38,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Lorem ipsum dolor sit amet consectetur. At ac etiam rutrum amet '
                'fringilla pellentesque ut fermentum tellus nunc. Nisl eu eget '
                'vestibulum sed vitae in. Etiam faucibus orci porta pellentesque.',
                style: TextStyle(
                  color: mutedTextColor,
                  fontSize: isMobile ? 13 : 15,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 14),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: const [
                  PrimaryButton(label: 'Support me', isMobile: false),
                  GhostButton(label: 'Courses', isMobile: false),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
