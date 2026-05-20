import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../widgets/footer.dart';
import '../../../widgets/hero_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color kPurple = Color(0xFF6A35FF);
  static const Color kDarkBg = Color(0xFF0B0913);
  static const Color kCardDark = Color(0xFF171325);
  static const Color kTextMutedDark = Color(0xFFA8A2B9);
  static const Color kTextMutedLight = Color(0xFF7D7A89);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned(
            top: -120,
            right: -100,
            child: Container(
              width: 520,
              height: 520,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(260),
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            left: -80,
            child: Container(
              width: 380,
              height: 380,
              decoration: BoxDecoration(
                color: AppColors.inversePrimary.withOpacity(0.05),
                borderRadius: BorderRadius.circular(190),
              ),
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 16 : 28,
                      vertical: isMobile ? 18 : 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeroSection(
                          isMobile: isMobile,
                          textColor: AppColors.onSurface,
                          mutedTextColor: AppColors.onSurfaceVariant,
                        ),
                        const SizedBox(height: 40),
                        Footer(
                          isMobile: isMobile,
                          textColor: AppColors.onSurface,
                          muted: AppColors.onSurfaceVariant,
                        ),
                        SizedBox(height: isMobile ? 24 : 32),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
