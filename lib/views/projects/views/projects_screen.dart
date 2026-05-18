import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../../../widgets/footer.dart';
import '../../../widgets/header.dart';
import '../../../widgets/project_card.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  static const _projects = [
    {
      'title': 'Architecture mobile fintech',
      'category': 'Mobile',
      'description':
          'Application de gestion de budget avec tableau de bord en temps réel et navigation fluide.',
      'tags': ['Flutter', 'GraphQL', 'Design system'],
    },
    {
      'title': 'Site vitrine startup SaaS',
      'category': 'Web',
      'description':
          'Landing page moderne avec animations subtiles et conversion optimisée.',
      'tags': ['React', 'TypeScript', 'Branding'],
    },
    {
      'title': 'Plateforme e-commerce',
      'category': 'Commerce',
      'description':
          'Expérience produit immersive avec micro-interactions et parcours utilisateur clair.',
      'tags': ['Vue.js', 'UI/UX', 'Performance'],
    },
    {
      'title': 'Dashboard analytics',
      'category': 'Dashboard',
      'description':
          'Interface de suivi d’indicateurs clés avec contrastes doux et visualisations claires.',
      'tags': ['Data', 'D3', 'Design system'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned(
            top: -100,
            left: -120,
            child: Container(
              width: 480,
              height: 480,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(260),
              ),
            ),
          ),
          Positioned(
            bottom: -120,
            right: -80,
            child: Container(
              width: 420,
              height: 420,
              decoration: BoxDecoration(
                color: AppColors.inversePrimary.withOpacity(0.05),
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
                        Header(
                          isMobile: isMobile,
                          activeSection: 'Projects',
                          onSectionTap: (section) {
                            if (section == 'Home') {
                              Future.microtask(
                                () => Navigator.pushReplacementNamed(
                                  context,
                                  '/',
                                ),
                              );
                            } else if (section == 'Stack') {
                              Future.microtask(
                                () => Navigator.pushReplacementNamed(
                                  context,
                                  '/stack',
                                ),
                              );
                            } else if (section == 'About') {
                              Future.microtask(
                                () => Navigator.pushReplacementNamed(
                                  context,
                                  '/about',
                                ),
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 28),
                        _buildHeroSection(isMobile),
                        const SizedBox(height: 28),
                        _buildFilters(isMobile),
                        const SizedBox(height: 28),
                        _buildProjectGrid(isMobile),
                        const SizedBox(height: 40),
                        Footer(
                          isMobile: isMobile,
                          textColor: AppColors.onSurface,
                          muted: AppColors.onSurfaceVariant,
                        ),
                        SizedBox(height: isMobile ? 24 : 32),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection(bool isMobile) {
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

  Widget _buildFilters(bool isMobile) {
    final filters = ['Tous', 'Mobile', 'Web', 'UI/UX', 'Brand'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            filters.map((label) {
              final selected = label == 'Tous';
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color:
                        selected
                            ? AppColors.primary
                            : AppColors.surfaceContainerHighest.withOpacity(
                              0.7,
                            ),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(
                      color:
                          selected
                              ? AppColors.primary
                              : AppColors.outlineVariant.withOpacity(0.15),
                    ),
                  ),
                  child: Text(
                    label,
                    style: GoogleFonts.jetBrainsMono(
                      color:
                          selected
                              ? AppColors.onPrimary
                              : AppColors.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildProjectGrid(bool isMobile) {
    return GridView.builder(
      itemCount: _projects.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 1 : 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: isMobile ? 1.05 : 1.1,
      ),
      itemBuilder: (context, index) {
        final project = _projects[index];
        return ProjectCard(
          title: project['title'] as String,
          category: project['category'] as String,
          description: project['description'] as String,
          tags: List<String>.from(project['tags'] as List<String>),
          isMobile: isMobile,
        );
      },
    );
  }
}
