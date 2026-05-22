import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../widgets/footer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const _strengths = [
    {
      'title': 'Conception fluide',
      'description':
          'Des expériences UI structurées pour renforcer la clarté et l’impact produit.',
    },
    {
      'title': 'Développement robuste',
      'description':
          'Code maintenable, performant et aligné sur les standards modernes.',
    },
    {
      'title': 'Travail en équipe',
      'description':
          'Communication transparente et delivery rapide avec des workflows agiles.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            Positioned(
              top: -100,
              left: -100,
              child: Container(
                width: 460,
                height: 460,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(260),
                ),
              ),
            ),
            Positioned(
              bottom: -120,
              right: -90,
              child: Container(
                width: 420,
                height: 420,
                decoration: BoxDecoration(
                  color: AppColors.inversePrimary.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(210),
                ),
              ),
            ),
            SingleChildScrollView(
              child: SafeArea(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 16 : 28,
                        vertical: isMobile ? 18 : 24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHero(isMobile),
                          const SizedBox(height: 28),
                          // _buildStatsSection(isMobile),
                          const SizedBox(height: 28),
                          _buildStrengths(isMobile),
                          const SizedBox(height: 40),
                          Footer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHero(bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 32),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow.withOpacity(0.92),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.14)),
      ),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: isMobile ? 0 : 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'À propos',
                  style: GoogleFonts.montserrat(
                    color: AppColors.onSurface,
                    fontSize: isMobile ? 38 : 52,
                    fontWeight: FontWeight.w700,
                    height: 1.05,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  'Je conçois des expériences digitales haut de gamme et je transforme des problématiques complexes en solutions claires, accessibles et performantes.',
                  style: GoogleFonts.inter(
                    color: AppColors.onSurfaceVariant,
                    fontSize: isMobile ? 15 : 18,
                    height: 1.7,
                  ),
                ),
                const SizedBox(height: 24),
                _buildBadges(),
              ],
            ),
          ),
          SizedBox(width: isMobile ? 0 : 36, height: isMobile ? 24 : 0),
          Expanded(flex: isMobile ? 0 : 4, child: _buildAboutVisual()),
        ],
      ),
    );
  }

  Widget _buildBadges() {
    final badges = ['Fullstack', 'Design system', 'Product thinking'];
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children:
          badges.map((label) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerHighest.withOpacity(0.9),
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: AppColors.primary.withOpacity(0.18)),
              ),
              child: Text(
                label,
                style: GoogleFonts.jetBrainsMono(
                  color: AppColors.onSurface,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  letterSpacing: 0.16,
                ),
              ),
            );
          }).toList(),
    );
  }

  Widget _buildAboutVisual() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          colors: [
            AppColors.surfaceContainerHigh.withOpacity(0.95),
            AppColors.surfaceContainerLow.withOpacity(0.95),
          ],
        ),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: AppColors.surfaceContainerHighest,
            ),
            child: SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 16,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: AppColors.primary.withOpacity(0.22),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 60,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.inversePrimary.withOpacity(0.16),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: LinearGradient(
                          colors: [
                            AppColors.surfaceContainerLow.withOpacity(0.82),
                            AppColors.surfaceContainerHigh.withOpacity(0.92),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Expertise visuelle',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: AppColors.onSurface,
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            height: 1.1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Philosophie',
                  style: GoogleFonts.montserrat(
                    color: AppColors.onSurface,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Créer des produits élégants et fiables où chaque interaction a du sens.',
                  style: GoogleFonts.inter(
                    color: AppColors.onSurfaceVariant,
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStatsSection(bool isMobile) {
    final stats = [
      {'value': '8+', 'label': 'années d’expérience'},
      {'value': '30+', 'label': 'projets livrés'},
      {'value': '15+', 'label': 'clients satisfaits'},
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children:
          stats.map((stat) {
            return Expanded(
              child: Container(
                margin: EdgeInsets.only(right: stat == stats.last ? 0 : 16),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 28,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerHighest.withOpacity(0.86),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: AppColors.outlineVariant.withOpacity(0.14),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stat['value'] as String,
                      style: GoogleFonts.montserrat(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w800,
                        fontSize: 32,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      stat['label'] as String,
                      style: GoogleFonts.inter(
                        color: AppColors.onSurfaceVariant,
                        fontSize: 14,
                        height: 1.7,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
    );
  }

  Widget _buildStrengths(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Points forts',
          style: GoogleFonts.montserrat(
            color: AppColors.onSurface,
            fontSize: isMobile ? 22 : 28,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 18),
        GridView.builder(
          itemCount: _strengths.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 1 : 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: isMobile ? 1.15 : 1.05,
          ),
          itemBuilder: (context, index) {
            final item = _strengths[index];
            return Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLow.withOpacity(0.92),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: AppColors.outlineVariant.withOpacity(0.14),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'] as String,
                    style: GoogleFonts.montserrat(
                      color: AppColors.onSurface,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    item['description'] as String,
                    style: GoogleFonts.inter(
                      color: AppColors.onSurfaceVariant,
                      fontSize: 14,
                      height: 1.75,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
