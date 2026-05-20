import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class GhostButton extends StatelessWidget {
  const GhostButton({
    super.key,
    required this.label,
    required this.isMobile,
    this.onTap,
  });

  final String label;
  final bool isMobile;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 18 : 22,
          vertical: isMobile ? 10 : 14,
        ),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLow.withOpacity(0.72),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: AppColors.outlineVariant.withOpacity(0.35)),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: AppColors.onSurfaceVariant,
            fontWeight: FontWeight.w600,
            fontSize: isMobile ? 14 : 15,
          ),
        ),
      ),
    );
  }
}
