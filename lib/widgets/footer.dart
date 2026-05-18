import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/theme/app_colors.dart';

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
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 24,
        vertical: isMobile ? 20 : 28,
      ),
      decoration: const BoxDecoration(color: AppColors.surfaceContainerLowest),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DevArchitect',
                      style: GoogleFonts.montserrat(
                        color: AppColors.onSurface,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '© 2024 DevArchitect. Crafted with precision.',
                      style: GoogleFonts.inter(
                        color: AppColors.onSurfaceVariant,
                        fontSize: 14,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
              if (!isMobile)
                Row(
                  children: [
                    _FooterLink(label: 'GitHub'),
                    _FooterLink(label: 'LinkedIn'),
                    _FooterLink(label: 'Twitter'),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 20,
            runSpacing: 10,
            children: [
              Text('GitHub', style: TextStyle(color: muted)),
              Text('LinkedIn', style: TextStyle(color: muted)),
              Text('Twitter', style: TextStyle(color: muted)),
              Text('Contact', style: TextStyle(color: muted)),
            ],
          ),
          const SizedBox(height: 20),
          if (!isMobile)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Designed for modern portfolios',
                  style: TextStyle(color: muted, fontSize: 12),
                ),
                Text(
                  'Terms & Conditions',
                  style: TextStyle(color: muted, fontSize: 12),
                ),
              ],
            )
          else ...[
            Text(
              'Designed for modern portfolios',
              style: TextStyle(color: muted, fontSize: 12),
            ),
            const SizedBox(height: 8),
            Text(
              'Terms & Conditions',
              style: TextStyle(color: muted, fontSize: 12),
            ),
          ],
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  const _FooterLink({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Text(
        label,
        style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 14),
      ),
    );
  }
}
