import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class NavigationItem extends StatelessWidget {
  const NavigationItem({super.key, required this.label, required this.icon});
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(icon),
      selectedIcon: Icon(icon, color: AppColors.primary),
      label: label,
    );
  }
}
