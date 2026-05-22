import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../widgets/primary_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.isMobile,
    required this.textColor,
    required this.mutedTextColor,
  });

  final bool isMobile;
  final Color textColor;
  final Color mutedTextColor;

  @override
  Widget build(BuildContext context) {
    final visualSize = isMobile ? 320.0 : 500.0;
    final leftPadding = isMobile ? 0.0 : 45.0;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 45,
        vertical: isMobile ? 24 : 48,
      ),
      child: SafeArea(
        child: Flex(
          direction: isMobile ? Axis.vertical : Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: isMobile ? 0 : 7,
              child: Padding(
                padding: EdgeInsets.only(right: leftPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAvailabilityBadge(),
                    const SizedBox(height: 20),
                    _buildTitle(),
                    const SizedBox(height: 24),
                    _buildDescription(),
                    const SizedBox(height: 28),
                    Wrap(
                      spacing: 16,
                      runSpacing: 12,
                      children: [
                        const PrimaryButton(
                          label: 'Voir mes projets',
                          isMobile: false,
                        ),
                        const PrimaryButton(
                          label: 'Me contacter',
                          isMobile: false,
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    _buildTechStack(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: isMobile ? double.infinity : visualSize,
              height: visualSize,
              child: _buildVisualCard(visualSize),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvailabilityBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow.withOpacity(0.9),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.18)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            'Disponible pour de nouveaux projets',
            style: GoogleFonts.jetBrainsMono(
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
              fontSize: 12,
              letterSpacing: 0.12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.montserrat(
          color: textColor,
          fontWeight: FontWeight.w700,
          fontSize: isMobile ? 32 : 64,
          height: 1.08,
          letterSpacing: -0.5,
        ),
        children: [
          const TextSpan(text: 'Concevoir des '),
          TextSpan(
            text: 'expériences',
            style: const TextStyle(
              color: AppColors.primary,
              fontStyle: FontStyle.italic,
            ),
          ),
          const TextSpan(text: ' fluides, du Mobile au Web.'),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.inter(
          color: mutedTextColor,
          fontWeight: FontWeight.w400,
          fontSize: isMobile ? 15 : 18,
          height: 1.6,
        ),
        children: [
          const TextSpan(text: 'Développeur Fullstack expert '),
          TextSpan(
            text: 'Flutter',
            style: const TextStyle(
              color: AppColors.onSurface,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primary,
              decorationThickness: 1.5,
            ),
          ),
          const TextSpan(
            text:
                ', passionné par React et Vue.js. Je transforme des idées complexes en interfaces élégantes et performantes.',
          ),
        ],
      ),
    );
  }

  Widget _buildTechStack() {
    return Opacity(
      opacity: 0.72,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 14,
        runSpacing: 12,
        children: [
          Text(
            'Technologies :',
            style: GoogleFonts.jetBrainsMono(
              color: AppColors.outlineVariant,
              fontSize: 12,
              letterSpacing: 0.2,
              fontWeight: FontWeight.w600,
            ),
          ),
          _buildTechLabel('Flutter'),
          _buildDot(),
          _buildTechLabel('React'),
          _buildDot(),
          _buildTechLabel('Vue.js'),
          _buildDot(),
          _buildTechLabel('Node.js'),
        ],
      ),
    );
  }

  Widget _buildTechLabel(String label) {
    return Text(
      label,
      style: GoogleFonts.jetBrainsMono(
        color: AppColors.onSurface,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildDot() {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: AppColors.outlineVariant,
        borderRadius: BorderRadius.circular(99),
      ),
    );
  }

  Widget _buildVisualCard(double size) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 16,
          right: -28,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.18),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.1),
                  blurRadius: 30,
                  spreadRadius: 4,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -20,
          left: -20,
          child: Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerHighest.withOpacity(0.4),
              borderRadius: BorderRadius.circular(48),
              border: Border.all(color: AppColors.primary.withOpacity(0.12)),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            alignment: Alignment.center,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: LinearGradient(
                  colors: [
                    AppColors.surfaceContainerHigh.withOpacity(0.85),
                    AppColors.surfaceContainerLow.withOpacity(0.95),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(child: _buildGlassSnippetCard()),
                          const SizedBox(width: 16),
                          Expanded(child: _buildImageCard()),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildMobileConceptCard(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGlassSnippetCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow.withOpacity(0.8),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.primary.withOpacity(0.12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.14),
            blurRadius: 22,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              _StatusDot(color: AppColors.error),
              SizedBox(width: 8),
              _StatusDot(color: AppColors.tertiary),
              SizedBox(width: 8),
              _StatusDot(color: AppColors.primary),
            ],
          ),
          const SizedBox(height: 18),
          _snippetLine(0.74, AppColors.primary.withOpacity(0.6)),
          const SizedBox(height: 10),
          _snippetLine(0.48, AppColors.outlineVariant.withOpacity(0.5)),
          const SizedBox(height: 10),
          _snippetLine(0.64, AppColors.primary.withOpacity(0.45)),
          const SizedBox(height: 18),
          Text(
            'main.dart',
            style: GoogleFonts.jetBrainsMono(
              color: AppColors.primary.withOpacity(0.68),
              fontSize: 10,
              letterSpacing: 0.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: const DecorationImage(
          image: NetworkImage(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuCme0ZYrqJA8A5DeM6S7V3zETIXoeZSlKyb6TxQSO38YI0Y_hsXq_6fU_MgWSPsZ5dD62CndmHX6rA_z_VY6-Vvrf2r7aAPI_14bef6aZ2iSvB7nDN9Lt6UarLDTBb9gzeTjrMJpuXtAbXIfOnswCWxgxjklQ3X6EJ3HHAQ0oe1rgEMG7mz9FZi_MqR6fxnWbmdodbY39uSNG0UBhmRbReY2qXNxHmAZC16zzv1OFKKY1PriYnNcy4qIR1SZLeU--Lip-TPeR6eVGc',
          ),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.primary.withOpacity(0.22),
          backgroundBlendMode: BlendMode.overlay,
        ),
      ),
    );
  }

  Widget _buildMobileConceptCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow.withOpacity(0.8),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.14)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.primary.withOpacity(0.18)),
            ),
            child: const Icon(Icons.devices, color: AppColors.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 110,
                  height: 10,
                  decoration: BoxDecoration(
                    color: AppColors.onSurface.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 160,
                  height: 8,
                  decoration: BoxDecoration(
                    color: AppColors.onSurfaceVariant.withOpacity(0.24),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Container(
            width: 72,
            height: 34,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.18),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Container(
                width: 32,
                height: 6,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _snippetLine(double widthFactor, Color color) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: Container(
        height: 8,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(99),
        ),
      ),
    );
  }
}

class _StatusDot extends StatelessWidget {
  const _StatusDot({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
