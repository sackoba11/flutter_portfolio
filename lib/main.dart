import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sacko A. B. Portfolio',
      debugShowCheckedModeBanner: false,
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

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
                    _Header(isMobile: isMobile, textColor: text),
                    const SizedBox(height: 26),
                    _HeroSection(
                      isMobile: isMobile,
                      textColor: text,
                      mutedTextColor: muted,
                    ),
                    const SizedBox(height: 42),
                    _SectionTitle(
                      title: 'Courses',
                      actionLabel: 'View all',
                      textColor: text,
                      actionColor: muted,
                    ),
                    const SizedBox(height: 14),
                    _CourseGrid(
                      isMobile: isMobile,
                      textColor: text,
                      muted: muted,
                    ),
                    const SizedBox(height: 42),
                    _SectionTitle(
                      title: 'Pricing',
                      actionLabel: '',
                      textColor: text,
                      actionColor: muted,
                    ),
                    const SizedBox(height: 14),
                    _PricingGrid(
                      isMobile: isMobile,
                      textColor: text,
                      muted: muted,
                    ),
                    const SizedBox(height: 42),
                    _SectionTitle(
                      title: 'Articles',
                      actionLabel: 'View all',
                      textColor: text,
                      actionColor: muted,
                    ),
                    const SizedBox(height: 14),
                    _ArticleGrid(
                      isMobile: isMobile,
                      textColor: text,
                      muted: muted,
                    ),
                    const SizedBox(height: 42),
                    _Footer(isMobile: isMobile, textColor: text, muted: muted),
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

class _Header extends StatelessWidget {
  const _Header({required this.isMobile, required this.textColor});

  final bool isMobile;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Mahdi Mirzadeh',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w800,
            fontSize: isMobile ? 18 : 22,
          ),
        ),
        const Spacer(),
        if (!isMobile) ...[
          _navItem('Courses'),
          _navItem('Pricing'),
          _navItem('Blog'),
          _navItem('About Me'),
          const SizedBox(width: 18),
          _GhostButton(label: 'Log in', isMobile: isMobile),
          const SizedBox(width: 10),
        ],
        _PrimaryButton(label: 'Sign up', isMobile: isMobile),
      ],
    );
  }

  Widget _navItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection({
    required this.isMobile,
    required this.textColor,
    required this.mutedTextColor,
  });

  final bool isMobile;
  final Color textColor;
  final Color mutedTextColor;

  @override
  Widget build(BuildContext context) {
    final avatarSize = isMobile ? 180.0 : 220.0;
    return Wrap(
      runSpacing: 24,
      spacing: 30,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Container(
          width: avatarSize,
          height: avatarSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFF221932), Color(0xFF7E3BFF), Color(0xFF0F0B18)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(
              color: isMobile ? Colors.white24 : Colors.black12,
            ),
          ),
          child: const Icon(Icons.person, size: 84, color: Colors.white70),
        ),
        SizedBox(
          width: isMobile ? 330 : 680,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Flutter Developer blia blia',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: isMobile ? 24 : 38,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Lorem ipsum dolor sit amet consectetur. At ac etiam rutrum amet '
                'fringilla pellentesque ut fermentum tellus nunc. Nisl eu eget '
                'vestibulum sed vitae in. Etiam faucibus orci porta pellentesque.',
                style: TextStyle(
                  color: mutedTextColor,
                  fontSize: isMobile ? 13 : 15,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 14),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: const [
                  _PrimaryButton(label: 'Support me', isMobile: false),
                  _GhostButton(label: 'Courses', isMobile: false),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.title,
    required this.actionLabel,
    required this.textColor,
    required this.actionColor,
  });

  final String title;
  final String actionLabel;
  final Color textColor;
  final Color actionColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w700,
            fontSize: 28,
          ),
        ),
        const Spacer(),
        if (actionLabel.isNotEmpty)
          Text(
            actionLabel,
            style: TextStyle(
              color: actionColor,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
      ],
    );
  }
}

class _CourseGrid extends StatelessWidget {
  const _CourseGrid({
    required this.isMobile,
    required this.textColor,
    required this.muted,
  });

  final bool isMobile;
  final Color textColor;
  final Color muted;

  @override
  Widget build(BuildContext context) {
    final items = [1, 2, 3];
    return GridView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 1 : 3,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: isMobile ? 1.32 : 0.88,
      ),
      itemBuilder: (context, index) {
        return _CourseCard(
          textColor: textColor,
          muted: muted,
          isMobile: isMobile,
        );
      },
    );
  }
}

class _CourseCard extends StatelessWidget {
  const _CourseCard({
    required this.textColor,
    required this.muted,
    required this.isMobile,
  });

  final Color textColor;
  final Color muted;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final dark = isMobile;
    return Container(
      decoration: BoxDecoration(
        color: dark ? PortfolioPage.kCardDark : const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: dark ? Colors.white10 : Colors.black12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF1D1A2F),
                  Color(0xFF1A4E7A),
                  Color(0xFF2935A0),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Center(
              child: Text(
                'Mixin in Dart',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Mixin in Dart',
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Lorem ipsum dolor sit amet consectetur. Ut aliquet lacus urna.',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: muted, height: 1.4, fontSize: 13),
          ),
          const SizedBox(height: 10),
          const _PrimaryButton(label: 'Learn More', isMobile: false),
        ],
      ),
    );
  }
}

class _PricingGrid extends StatelessWidget {
  const _PricingGrid({
    required this.isMobile,
    required this.textColor,
    required this.muted,
  });

  final bool isMobile;
  final Color textColor;
  final Color muted;

  @override
  Widget build(BuildContext context) {
    final plans = [
      ('Basic', '\$100'),
      ('Pro', '\$500'),
      ('Pro Plus', '\$2000'),
    ];
    return GridView.builder(
      itemCount: plans.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 1 : 3,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: isMobile ? 1.4 : 0.9,
      ),
      itemBuilder: (context, index) {
        final plan = plans[index];
        return _PricingCard(
          plan: plan.$1,
          price: plan.$2,
          textColor: textColor,
          muted: muted,
          isMobile: isMobile,
        );
      },
    );
  }
}

class _PricingCard extends StatelessWidget {
  const _PricingCard({
    required this.plan,
    required this.price,
    required this.textColor,
    required this.muted,
    required this.isMobile,
  });

  final String plan;
  final String price;
  final Color textColor;
  final Color muted;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final dark = isMobile;
    return Container(
      decoration: BoxDecoration(
        color: dark ? PortfolioPage.kCardDark : const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: dark ? Colors.white10 : Colors.black12),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Tag(label: plan),
          const SizedBox(height: 12),
          Text(
            price,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w800,
              fontSize: 38,
            ),
          ),
          Text('/ month', style: TextStyle(color: muted, fontSize: 14)),
          const SizedBox(height: 14),
          ...const [
            _Feature(text: 'Video lessons'),
            _Feature(text: 'Source code'),
            _Feature(text: 'Live support'),
            _Feature(text: 'Bonus assets'),
          ],
          const Spacer(),
          const _PrimaryButton(label: 'Get Started', isMobile: false),
        ],
      ),
    );
  }
}

class _ArticleGrid extends StatelessWidget {
  const _ArticleGrid({
    required this.isMobile,
    required this.textColor,
    required this.muted,
  });

  final bool isMobile;
  final Color textColor;
  final Color muted;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 1 : 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: isMobile ? 1.2 : 1.5,
      ),
      itemBuilder: (context, index) {
        return _ArticleCard(
          textColor: textColor,
          muted: muted,
          isMobile: isMobile,
        );
      },
    );
  }
}

class _ArticleCard extends StatelessWidget {
  const _ArticleCard({
    required this.textColor,
    required this.muted,
    required this.isMobile,
  });

  final Color textColor;
  final Color muted;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final dark = isMobile;
    return Container(
      decoration: BoxDecoration(
        color: dark ? PortfolioPage.kCardDark : const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: dark ? Colors.white10 : Colors.black12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF1B1930),
                  Color(0xFF1D4E79),
                  Color(0xFF2A42AF),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Mixin in Dart',
            style: TextStyle(color: textColor, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          Text(
            'Lorem ipsum dolor sit amet consectetur. Urna egestas pulvinar.',
            style: TextStyle(color: muted, height: 1.4),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          _GhostButton(label: 'Design', isMobile: isMobile),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({
    required this.isMobile,
    required this.textColor,
    required this.muted,
  });

  final bool isMobile;
  final Color textColor;
  final Color muted;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 10,
          alignment: WrapAlignment.spaceBetween,
          children: [
            Text(
              'Mahdi Mirzadeh',
              style: TextStyle(color: textColor, fontWeight: FontWeight.w700),
            ),
            Text('Courses', style: TextStyle(color: muted)),
            Text('Pricing', style: TextStyle(color: muted)),
            Text('Blog', style: TextStyle(color: muted)),
            Text('About me', style: TextStyle(color: muted)),
            Text('Contact me', style: TextStyle(color: muted)),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Text(
              '2026 MahdiMirzadeh, All rights reserved',
              style: TextStyle(color: muted, fontSize: 12),
            ),
            const Spacer(),
            Text(
              'Privacy & Policy',
              style: TextStyle(color: muted, fontSize: 12),
            ),
            const SizedBox(width: 14),
            Text(
              'Terms & Conditions',
              style: TextStyle(color: muted, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: PortfolioPage.kPurple,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}

class _Feature extends StatelessWidget {
  const _Feature({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          const Icon(Icons.check, size: 16),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({required this.label, required this.isMobile});

  final String label;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 14 : 18,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: PortfolioPage.kPurple,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: isMobile ? 12 : 13,
        ),
      ),
    );
  }
}

class _GhostButton extends StatelessWidget {
  const _GhostButton({required this.label, required this.isMobile});

  final String label;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final darkMode =
        Theme.of(context).scaffoldBackgroundColor.computeLuminance() < 0.2;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 14 : 18,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: darkMode ? Colors.white30 : Colors.black26),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: darkMode ? Colors.white : const Color(0xFF1B1A25),
          fontWeight: FontWeight.w600,
          fontSize: isMobile ? 12 : 13,
        ),
      ),
    );
  }
}
