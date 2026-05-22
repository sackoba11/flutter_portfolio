import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';

class ProjectHeroSection extends StatelessWidget {
  const ProjectHeroSection({super.key, required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 32),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow.withOpacity(0.92),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.14)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projets',
            style: GoogleFonts.montserrat(
              color: AppColors.onSurface,
              fontSize: isMobile ? 38 : 52,
              fontWeight: FontWeight.w700,
              height: 1.05,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'Découvrez une sélection de réalisations pensées pour le mobile, le web et les interfaces produit.',
            style: GoogleFonts.inter(
              color: AppColors.onSurfaceVariant,
              fontSize: isMobile ? 15 : 18,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}
