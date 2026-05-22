import 'package:flutter/material.dart';

import 'project_card.dart';

class ProjectGrid extends StatelessWidget {
  const ProjectGrid({
    super.key,
    required List<Map<String, Object>> projects,
    required this.isMobile,
  }) : _projects = projects;

  final List<Map<String, Object>> _projects;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
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
