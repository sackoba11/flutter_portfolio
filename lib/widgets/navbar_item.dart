import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/theme/app_colors.dart';

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
    var onHoverColor = Colors.transparent;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration:
              isActive
                  ? const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.primary, width: 2),
                    ),
                  )
                  : BoxDecoration(color: onHoverColor),
          child: Text(
            text,
            style: GoogleFonts.montserrat(
              color: effectiveColor,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
              fontSize: 14,
              letterSpacing: 0.02,
            ),
          ),
        ),
      ),
    );
  }
}
