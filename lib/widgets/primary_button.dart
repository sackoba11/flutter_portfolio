import 'package:flutter/material.dart';

import '../views/home/views/home_screen.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.label, required this.isMobile});

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
        color: HomeScreen.kPurple,
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
