import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
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
    return Column(
      children: [
        const Divider(),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 10,
          alignment: WrapAlignment.spaceBetween,
          children: [
            Text(
              'Mahdi Mirzadeh',
              style: TextStyle(color: textColor, fontWeight: FontWeight.w700),
            ),
            Text('Courses', style: TextStyle(color: muted)),
            Text('Pricing', style: TextStyle(color: muted)),
            Text('Blog', style: TextStyle(color: muted)),
            Text('About me', style: TextStyle(color: muted)),
            Text('Contact me', style: TextStyle(color: muted)),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Text(
              '2026 MahdiMirzadeh, All rights reserved',
              style: TextStyle(color: muted, fontSize: 12),
            ),
            const Spacer(),
            Text(
              'Privacy & Policy',
              style: TextStyle(color: muted, fontSize: 12),
            ),
            const SizedBox(width: 14),
            Text(
              'Terms & Conditions',
              style: TextStyle(color: muted, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}
