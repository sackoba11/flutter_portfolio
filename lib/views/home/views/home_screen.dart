import 'package:flutter/material.dart';

import '../../../widgets/article_grid.dart';
import '../../../widgets/course_grid.dart';
import '../../../widgets/footer.dart';
import '../../../widgets/header.dart';
import '../../../widgets/hero_section.dart';
import '../../../widgets/pricing_grid.dart';
import '../../../widgets/section_title.dart';

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
    final bg = isMobile ? kDarkBg : Colors.white;
    final text = isMobile ? Colors.white : const Color(0xFF151321);
    final muted = isMobile ? kTextMutedDark : kTextMutedLight;

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1160),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 16 : 30,
                  vertical: isMobile ? 18 : 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(isMobile: isMobile, textColor: text),
                    const SizedBox(height: 26),
                    HeroSection(
                      isMobile: isMobile,
                      textColor: text,
                      mutedTextColor: muted,
                    ),
                    const SizedBox(height: 42),
                    SectionTitle(
                      title: 'Courses',
                      actionLabel: 'View all',
                      textColor: text,
                      actionColor: muted,
                    ),
                    const SizedBox(height: 14),
                    CourseGrid(
                      isMobile: isMobile,
                      textColor: text,
                      muted: muted,
                    ),
                    const SizedBox(height: 42),
                    SectionTitle(
                      title: 'Pricing',
                      actionLabel: '',
                      textColor: text,
                      actionColor: muted,
                    ),
                    const SizedBox(height: 14),
                    PricingGrid(
                      isMobile: isMobile,
                      textColor: text,
                      muted: muted,
                    ),
                    const SizedBox(height: 42),
                    SectionTitle(
                      title: 'Articles',
                      actionLabel: 'View all',
                      textColor: text,
                      actionColor: muted,
                    ),
                    const SizedBox(height: 14),
                    ArticleGrid(
                      isMobile: isMobile,
                      textColor: text,
                      muted: muted,
                    ),
                    const SizedBox(height: 42),
                    Footer(isMobile: isMobile, textColor: text, muted: muted),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
