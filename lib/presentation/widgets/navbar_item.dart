import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';

class NavbarItem extends StatelessWidget {
  const NavbarItem({
    super.key,
    required this.text,
    required this.textColor,
    this.onTap,
    this.isActive = false,
  });

  final String text;
  final Color textColor;
  final VoidCallback? onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = isActive ? AppColors.primary : textColor;
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        overlayColor: WidgetStatePropertyAll(
          AppColors.primary.withOpacity(0.1),
        ),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        ),
        mouseCursor: WidgetStatePropertyAll(SystemMouseCursors.click),
        backgroundColor: WidgetStatePropertyAll(AppColors.transparent),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side:
                isActive
                    ? const BorderSide(color: AppColors.primary, width: 2)
                    : BorderSide.none,
          ),
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          color: effectiveColor,
          fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
          fontSize: 14,
          letterSpacing: 0.02,
        ),
      ),
    );
  }
}
