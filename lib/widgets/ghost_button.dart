import 'package:flutter/material.dart';

class GhostButton extends StatelessWidget {
  const GhostButton({super.key, required this.label, required this.isMobile});

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
