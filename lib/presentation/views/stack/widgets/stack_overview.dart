import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';

class StackOverview extends StatelessWidget {
  const StackOverview({super.key, required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHighest.withOpacity(0.82),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.14)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Compétences clés',
                  style: GoogleFonts.montserrat(
                    color: AppColors.onSurface,
                    fontSize: isMobile ? 18 : 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Un stack technique complet pour des projets Fullstack, du prototype à la production. Chaque technologie est choisie pour sa fiabilité, sa maintenabilité et son impact produit.',
                  style: GoogleFonts.inter(
                    color: AppColors.onSurfaceVariant,
                    fontSize: isMobile ? 14 : 16,
                    height: 1.7,
                  ),
                ),
              ],
            ),
          ),
          if (!isMobile)
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLow,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.primary.withOpacity(0.18)),
              ),
              child: Center(
                child: Text(
                  '100+ skills',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: AppColors.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 1.15,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
