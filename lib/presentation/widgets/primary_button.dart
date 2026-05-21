import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
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
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 18 : 22,
          vertical: isMobile ? 10 : 14,
        ),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(999),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.18),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: AppColors.onPrimary,
            fontWeight: FontWeight.w700,
            fontSize: isMobile ? 14 : 15,
            letterSpacing: 0.2,
          ),
        ),
      ),
    );
  }
}
