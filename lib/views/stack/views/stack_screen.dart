import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../../../widgets/footer.dart';
import '../../../widgets/header.dart';

class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  static const _stackItems = [
    {
      'title': 'Frameworks & UI',
      'description': 'Flutter, React, Vue.js, Tailwind CSS, Material Design.',
      'skills': ['Flutter', 'React', 'Vue.js', 'Tailwind'],
    },
    {
      'title': 'Backend & APIs',
      'description':
          'Node.js, GraphQL, Firebase, REST, serverless architectures.',
      'skills': ['Node.js', 'GraphQL', 'Firebase', 'REST'],
    },
    {
      'title': 'Design & Prod',
      'description':
          'Figma, UX systems, animation, accessibility et performance.',
      'skills': ['Figma', 'UX', 'Animation', 'Performance'],
    },
    {
      'title': 'Ops & Quality',
      'description':
          'CI/CD, tests automatisés, Git, Docker et déploiements modernes.',
      'skills': ['CI/CD', 'Git', 'Docker', 'Tests'],
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
            right: -120,
            child: Container(
              width: 420,
              height: 420,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(260),
              ),
            ),
          ),
          Positioned(
            bottom: -120,
            left: -80,
            child: Container(
              width: 380,
              height: 380,
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
                          activeSection: 'Stack',
                          onSectionTap: (section) {
                            if (section == 'Home') {
                              Future.microtask(
                                () => Navigator.pushReplacementNamed(
                                  context,
                                  '/',
                                ),
                              );
                            } else if (section == 'Projects') {
                              Future.microtask(
                                () => Navigator.pushReplacementNamed(
                                  context,
                                  '/projects',
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
                        _buildStackOverview(isMobile),
                        const SizedBox(height: 28),
                        _buildSkillGrid(isMobile),
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
            'Stack Technique',
            style: GoogleFonts.montserrat(
              color: AppColors.onSurface,
              fontSize: isMobile ? 38 : 52,
              fontWeight: FontWeight.w700,
              height: 1.05,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'Un ensemble de technologies et de pratiques conçu pour créer des expériences élégantes, fiables et hautes performances.',
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

  Widget _buildStackOverview(bool isMobile) {
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

  Widget _buildSkillGrid(bool isMobile) {
    return GridView.builder(
      itemCount: _stackItems.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 1 : 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: isMobile ? 1.1 : 1.05,
      ),
      itemBuilder: (context, index) {
        final item = _stackItems[index];
        return _StackCard(
          title: item['title'] as String,
          description: item['description'] as String,
          skills: List<String>.from(item['skills'] as List<String>),
        );
      },
    );
  }
}

class _StackCard extends StatelessWidget {
  const _StackCard({
    required this.title,
    required this.description,
    required this.skills,
  });

  final String title;
  final String description;
  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow.withOpacity(0.92),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.14)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(
              color: AppColors.onSurface,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            description,
            style: GoogleFonts.inter(
              color: AppColors.onSurfaceVariant,
              fontSize: 15,
              height: 1.7,
            ),
          ),
          const Spacer(),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children:
                skills
                    .map(
                      (skill) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.14),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          skill,
                          style: GoogleFonts.jetBrainsMono(
                            color: AppColors.onPrimaryContainer,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}
