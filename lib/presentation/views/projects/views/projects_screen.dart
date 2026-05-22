import 'package:flutter/material.dart';

import '../../../widgets/footer.dart';
import '../../home/screen/wrapper_screen.dart';
import '../widgets/filter_widget.dart';
import '../widgets/hero_section.dart';
import '../widgets/project_grid.dart';

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

    return WrapperScreen(
      isFirstModel: false,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 45,
              vertical: isMobile ? 24 : 48,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProjectHeroSection(isMobile: isMobile),
                const SizedBox(height: 28),
                FiltersWidget(isMobile: isMobile),
                const SizedBox(height: 28),
                ProjectGrid(projects: _projects, isMobile: isMobile),
                const SizedBox(height: 40),
              ],
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}
