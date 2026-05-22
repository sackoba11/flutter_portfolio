import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import '../views/home/controller/home_controller.dart';
import 'footer_link.dart';

class Footer extends GetView<HomeController> {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: controller.isMobile.value ? 12 : 45,
        vertical: controller.isMobile.value ? 20 : 48,
      ),
      decoration: const BoxDecoration(color: AppColors.surfaceContainerLowest),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DevArchitect',
                      style: GoogleFonts.montserrat(
                        color: AppColors.onSurface,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '© 2026 DevArchitect. Crafted with precision.',
                      style: GoogleFonts.inter(
                        color: AppColors.onSurfaceVariant,
                        fontSize: 14,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
              if (!controller.isMobile.value)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Connect with me:',
                      style: GoogleFonts.inter(
                        color: AppColors.onSurfaceVariant,
                        fontSize: 14,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      spacing: 30,
                      children: [
                        FooterLink(label: 'GitHub'),
                        FooterLink(label: 'LinkedIn'),
                        FooterLink(label: 'Twitter'),
                      ],
                    ),
                  ],
                ),
            ],
          ),
          if (controller.isMobile.value)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Text(
                  'Connect with me:',
                  style: GoogleFonts.inter(
                    color: AppColors.onSurfaceVariant,
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  spacing: 20,
                  children: [
                    FooterLink(label: 'GitHub'),
                    FooterLink(label: 'LinkedIn'),
                    FooterLink(label: 'Twitter'),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}
