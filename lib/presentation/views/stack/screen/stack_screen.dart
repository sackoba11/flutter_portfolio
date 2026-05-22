import 'package:flutter/material.dart';

import '../../../widgets/footer.dart';
import '../../home/screen/wrapper_screen.dart';
import '../widgets/skill_grid.dart';
import '../widgets/stack_hero_section.dart';
import '../widgets/stack_overview.dart';

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

    return WrapperScreen(
      isFirstModel: true,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 45,
              vertical: isMobile ? 18 : 48,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StackHeroSection(isMobile: isMobile),
                const SizedBox(height: 28),
                StackOverview(isMobile: isMobile),
                const SizedBox(height: 28),
                SkillGrid(stackItems: _stackItems, isMobile: isMobile),
              ],
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}
