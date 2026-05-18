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
    this.onSectionTap,
  });

  final bool isMobile;
  final String activeSection;
  final void Function(String section)? onSectionTap;

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
            children: [
              Text(
                'DevArchitect',
                style: GoogleFonts.montserrat(
                  color: AppColors.onSurface,
                  fontWeight: FontWeight.w800,
                  fontSize: isMobile ? 18 : 22,
                ),
              ),
              const Spacer(),
              if (!isMobile) ...[
                NavbarItem(
                  text: 'Home',
                  textColor: AppColors.onSurfaceVariant,
                  isActive: activeSection == 'Home',
                  onTap: () => onSectionTap?.call('Home'),
                ),
                NavbarItem(
                  text: 'Projects',
                  textColor: AppColors.onSurfaceVariant,
                  isActive: activeSection == 'Projects',
                  onTap: () => onSectionTap?.call('Projects'),
                ),
                NavbarItem(
                  text: 'Stack',
                  textColor: AppColors.onSurfaceVariant,
                  onTap: () => onSectionTap?.call('Stack'),
                ),
                NavbarItem(
                  text: 'About',
                  textColor: AppColors.onSurfaceVariant,
                  onTap: () => onSectionTap?.call('About'),
                ),
                NavbarItem(
                  text: 'Contact',
                  textColor: AppColors.onSurfaceVariant,
                  onTap: () => onSectionTap?.call('Contact'),
                ),
                const SizedBox(width: 18),
                GhostButton(label: 'Hire Me', isMobile: false),
              ] else ...[
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                  color: AppColors.onSurface,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
