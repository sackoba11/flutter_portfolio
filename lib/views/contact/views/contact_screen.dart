import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../../../widgets/footer.dart';
import '../../../widgets/header.dart';
import '../../../widgets/primary_button.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);

      Future.delayed(const Duration(milliseconds: 1500), () {
        if (mounted) {
          setState(() => _isSubmitting = false);
          _formKey.currentState!.reset();
          _nameController.clear();
          _emailController.clear();
          _subjectController.clear();
          _messageController.clear();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Message envoyé avec succès!',
                style: GoogleFonts.inter(color: AppColors.onSurface),
              ),
              backgroundColor: AppColors.primary,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      });
    }
  }

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
                        Header(
                          isMobile: isMobile,
                          activeSection: 'Contact',
                          onSectionTap: (section) {
                            if (section == 'Home') {
                              Future.microtask(
                                () => Navigator.pushReplacementNamed(
                                  context,
                                  '/',
                                ),
                              );
                            } else if (section == 'Projects') {
                              Future.microtask(
                                () => Navigator.pushReplacementNamed(
                                  context,
                                  '/projects',
                                ),
                              );
                            } else if (section == 'Stack') {
                              Future.microtask(
                                () => Navigator.pushReplacementNamed(
                                  context,
                                  '/stack',
                                ),
                              );
                            } else if (section == 'About') {
                              Future.microtask(
                                () => Navigator.pushReplacementNamed(
                                  context,
                                  '/about',
                                ),
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 28),
                        _buildHeroSection(isMobile),
                        const SizedBox(height: 40),
                        _buildContactContent(isMobile),
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

  Widget _buildHeroSection(bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 32),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow.withOpacity(0.92),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.14)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: GoogleFonts.montserrat(
                color: AppColors.onSurface,
                fontWeight: FontWeight.w700,
                fontSize: isMobile ? 38 : 52,
                height: 1.05,
                letterSpacing: -0.5,
              ),
              children: [
                const TextSpan(text: 'Construisons quelque chose '),
                TextSpan(
                  text: 'extraordinaire',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const TextSpan(text: ' ensemble.'),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'Que vous ayez un projet spécifique en tête ou que vous souhaitiez simplement discuter d\'architecture technique, ma boîte mail est toujours ouverte.',
            style: GoogleFonts.inter(
              color: AppColors.onSurfaceVariant,
              fontSize: isMobile ? 15 : 18,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactContent(bool isMobile) {
    if (isMobile) {
      return Column(
        children: [
          _buildContactForm(),
          const SizedBox(height: 28),
          _buildContactInfo(),
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 7, child: _buildContactForm()),
        const SizedBox(width: 28),
        Expanded(flex: 5, child: _buildContactInfo()),
      ],
    );
  }

  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow.withOpacity(0.92),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.14)),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFormField(
              controller: _nameController,
              label: 'Nom',
              hint: 'Jean Dupont',
              validator:
                  (value) =>
                      value?.isEmpty ?? true ? 'Le nom est requis' : null,
            ),
            const SizedBox(height: 20),
            _buildFormField(
              controller: _emailController,
              label: 'Email',
              hint: 'jean@example.com',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value?.isEmpty ?? true) return 'L\'email est requis';
                if (!value!.contains('@')) return 'Email invalide';
                return null;
              },
            ),
            const SizedBox(height: 20),
            _buildFormField(
              controller: _subjectController,
              label: 'Sujet',
              hint: 'Demande de projet',
              validator:
                  (value) =>
                      value?.isEmpty ?? true ? 'Le sujet est requis' : null,
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Message',
                  style: GoogleFonts.jetBrainsMono(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0.16,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _messageController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Parlez-moi de votre vision...',
                    hintStyle: GoogleFonts.inter(
                      color: AppColors.onSurfaceVariant.withOpacity(0.5),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.outlineVariant.withOpacity(0.3),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.primary,
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  style: GoogleFonts.inter(
                    color: AppColors.onSurface,
                    fontSize: 16,
                  ),
                  validator:
                      (value) =>
                          value?.isEmpty ?? true
                              ? 'Le message est requis'
                              : null,
                ),
              ],
            ),
            const SizedBox(height: 28),
            GestureDetector(
              onTap: _isSubmitting ? null : _handleSubmit,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color:
                      _isSubmitting
                          ? AppColors.primary.withOpacity(0.6)
                          : AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.2),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _isSubmitting
                          ? 'Envoi en cours...'
                          : 'Envoyer le message',
                      style: GoogleFonts.jetBrainsMono(
                        color: AppColors.onPrimary,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        letterSpacing: 0.2,
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (_isSubmitting)
                      SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation(
                            AppColors.onPrimary.withOpacity(0.8),
                          ),
                        ),
                      )
                    else
                      const Icon(Icons.send, size: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.jetBrainsMono(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
            fontSize: 12,
            letterSpacing: 0.16,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.inter(
              color: AppColors.onSurfaceVariant.withOpacity(0.5),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.outlineVariant.withOpacity(0.3),
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
          style: GoogleFonts.inter(color: AppColors.onSurface, fontSize: 16),
          validator: validator,
        ),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerHighest.withOpacity(0.86),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: AppColors.outlineVariant.withOpacity(0.14),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Coordonnées',
                style: GoogleFonts.montserrat(
                  color: AppColors.onSurface,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              _buildContactLink(
                icon: Icons.mail_outline,
                label: 'Email',
                value: 'hello@devarchitect.com',
              ),
              const SizedBox(height: 20),
              _buildContactLink(
                icon: Icons.code,
                label: 'GitHub',
                value: 'github.com/devarchitect',
              ),
              const SizedBox(height: 20),
              _buildContactLink(
                icon: Icons.work_outline,
                label: 'LinkedIn',
                value: 'linkedin.com/in/devarchitect',
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.08),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.primary.withOpacity(0.2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF4ADE80),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF4ADE80).withOpacity(0.5),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Disponible pour de nouvelles opportunités',
                      style: GoogleFonts.jetBrainsMono(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'Je prends actuellement des projets freelance sélectifs et des rôles d\'ingénierie senior en CDI.',
                style: GoogleFonts.inter(
                  color: AppColors.onSurfaceVariant,
                  fontSize: 14,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactLink({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.outlineVariant.withOpacity(0.14),
            ),
          ),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.jetBrainsMono(
                  color: AppColors.onSurfaceVariant.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                  fontSize: 11,
                  letterSpacing: 0.1,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: GoogleFonts.inter(
                  color: AppColors.onSurface,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
