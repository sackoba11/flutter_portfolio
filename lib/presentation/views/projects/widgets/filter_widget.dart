import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';

class FiltersWidget extends StatelessWidget {
  const FiltersWidget({super.key, required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final filters = ['Tous', 'Mobile', 'Web', 'UI/UX', 'Brand'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            filters.map((label) {
              final selected = label == 'Tous';
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color:
                        selected
                            ? AppColors.primary
                            : AppColors.surfaceContainerHighest.withOpacity(
                              0.7,
                            ),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(
                      color:
                          selected
                              ? AppColors.primary
                              : AppColors.outlineVariant.withOpacity(0.15),
                    ),
                  ),
                  child: Text(
                    label,
                    style: GoogleFonts.jetBrainsMono(
                      color:
                          selected
                              ? AppColors.onPrimary
                              : AppColors.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
