import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
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
    var size = MediaQuery.sizeOf(context);
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 35),
          decoration: BoxDecoration(
            color: AppColors.surface,
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
                GhostButton(label: hireLabel, onTap: onHireTap),
              ] else ...[
                PopupMenuButton<String>(
                  constraints: BoxConstraints(minWidth: size.width * 0.9),
                  icon: const Icon(
                    Icons.menu,
                    color: AppColors.onSurfaceVariant,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  tooltip: 'Menu',
                  elevation: 4,
                  popUpAnimationStyle: AnimationStyle(
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 800),
                  ),
                  color: AppColors.surface,
                  position: PopupMenuPosition.under,
                  style: ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(
                      AppColors.primary.withOpacity(0.1),
                    ),
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    ),
                    mouseCursor: WidgetStatePropertyAll(
                      SystemMouseCursors.click,
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      AppColors.transparent,
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: const BorderSide(
                          color: AppColors.primary,
                          width: 2,
                        ),
                      ),
                    ),
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
                          PopupMenuItem(
                            value: section,
                            child: SizedBox(
                              width: double.infinity,
                              child: NavbarItem(
                                text: section,
                                textColor: AppColors.onSurfaceVariant,
                                isActive: activeSection == section,
                              ),
                            ),
                          ),
                        if (onHireTap != null)
                          PopupMenuItem(
                            value: hireLabel,
                            child: SizedBox(
                              width: double.infinity,
                              child: GhostButton(
                                label: hireLabel,
                                onTap: onHireTap,
                              ),
                            ),
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
