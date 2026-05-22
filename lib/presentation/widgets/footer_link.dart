import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class FooterLink extends StatelessWidget {
  const FooterLink({super.key, required this.label, this.onTap});

  final String label;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle link tap
      },
      child: Text(
        label,
        style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 14),
      ),
    );
  }
}
