import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/theme/app_colors.dart';
import 'ghost_button.dart';
import 'navbar_item.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.isMobile,
    required this.activeSection,
    this.sections = const ['Home', 'Projects', 'Stack', 'About', 'Contact'],
    this.onSectionTap,
    this.onHireTap,
    this.hireLabel = 'Hire Me',
  });

  final bool isMobile;
  final String activeSection;
  final List<String> sections;
  final void Function(String section)? onSectionTap;
  final VoidCallback? onHireTap;
  final String hireLabel;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 20),
          decoration: BoxDecoration(
            color: AppColors.surface.withOpacity(0.58),
            border: Border(
              bottom: BorderSide(
                color: AppColors.outlineVariant.withOpacity(0.12),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'DevArchitect',
                style: GoogleFonts.montserrat(
                  color: AppColors.onSurface,
                  fontWeight: FontWeight.w800,
                  fontSize: isMobile ? 18 : 22,
                ),
              ),

              if (!isMobile) ...[
                Row(
                  children: [
                    for (final section in sections)
                      NavbarItem(
                        text: section,
                        textColor: AppColors.onSurfaceVariant,
                        isActive: activeSection == section,
                        onTap: () => onSectionTap?.call(section),
                      ),
                  ],
                ),
                if (onHireTap != null) ...[
                  const SizedBox(width: 18),
                  GhostButton(
                    label: hireLabel,
                    isMobile: isMobile,
                    onTap: onHireTap,
                  ),
                ],
              ] else ...[
                PopupMenuButton<String>(
                  icon: const Icon(Icons.menu),
                  color: AppColors.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  onSelected: (value) {
                    if (value == hireLabel) {
                      onHireTap?.call();
                    } else {
                      onSectionTap?.call(value);
                    }
                  },
                  itemBuilder:
                      (_) => [
                        for (final section in sections)
                          PopupMenuItem(value: section, child: Text(section)),
                        if (onHireTap != null)
                          PopupMenuItem(
                            value: hireLabel,
                            child: Text(hireLabel),
                          ),
                      ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
